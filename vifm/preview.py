#!/home/skoepnick/.local/python/bin/python

import sys
import xxhash
import exifread
import redis
import tempfile
import pty
import os
import subprocess
import numpy as np

target = sys.argv[1] #'/home/skoepnick/Data/74.67.74.242/HDD/Couple/Home/IMG_1528.JPG'

from glob import glob
from PIL import Image, ImageDraw, ImageFont, ExifTags
import io

from libsixel.encoder import Encoder
from libsixel import SIXEL_OPTFLAG_WIDTH, SIXEL_OPTFLAG_HEIGHT
import libsixel
encoder=Encoder()
encoder.setopt(SIXEL_OPTFLAG_WIDTH, 400)
encoder.setopt(SIXEL_OPTFLAG_HEIGHT, 600)
TAGS = ExifTags.TAGS
GPSTAGS = ExifTags.GPSTAGS

def persist(image_hash, image_data):
    r = redis.StrictRedis(host='localhost', port=6379, db=0)
    r.set(image_hash, image_data.getvalue())

def retrieve(image_hash):
    r = redis.StrictRedis(host='localhost', port=6379, db=0)
    return r.get(image_hash)


def thumbnail(filename=target, width=200, height=300):
    try:
        canvas = Image.new('RGB', (width, height))
        im = Image.open(filename)
        w, h = im.size
        with open(filename, 'rb') as fh:
            exif = exifread.process_file(fh)
        im.thumbnail((width, width))
        canvas.paste(im, (0, 0))
        font = ImageFont.truetype("/home/skoepnick/.local/share/fonts/anon.ttf", 16)
        editable = ImageDraw.Draw(canvas)
        offset =  height // 2
        output_tags = (
            'EXIF DateTimeOriginal',
            'Image Make',
            'Image Model',
            'Image Software', 
            'GPS GPSSpeed',
            'GPS GPSLatitude',
            'GPS GPSLongitude',
            'GPS GPSDate',
        )
        i = 0
        for key, value in exif.items():
            if key in output_tags:
                offset = offset + 15
                i += 1
                editable.text((15, offset), f"{key}: {value}", (200, 200, 200), font=font)
            # if key in TAGS:
            #     tag_name = TAGS[key]
            #     if tag_name == 'GPSInfo':
            #         print(tag_name, value)
            #     # if tag_name in output_tags:
                
        buff = io.BytesIO()
        canvas.save(buff, format='png')
        buff.seek(0)
        canvas.save('/tmp/preview.png', format='png')
        return canvas, buff
    except:
        pass
    return False

def save_preview(canvas, preview_path):
    """
    Leaving this discrete just in case I feel like trying
    to write directly from the Sixel library again
    """
    canvas.save(preview_path, format='png')
    # buff.seprocess_fileek(0)
    #img = libsixel.sixel_encode("/tmp/preview.png")
    #img = encoder.encode_bytes()

    # master, servant = pty.openpty()
    # stdout = sys.stdout
    # sys.stdout = os.fdopen(servant, 'w')
    # encoder.encode("/tmp/preview.png")
    # encoder.encode_bytes(np_img.tobytes(), w, h, 3, None)
    # sys.stdout = stdout
    # sys.stdout.flush()
    # breakpoint()
    # sys.stdout = os.fdopen(master)
    # output = os.read(master, 1024)
    # os.write(1, output)

    # sys.stdout.write(img)

def load_data(filename):
    """
    This may seem cumbersome and not in the Zen of Python,
    but in this situation I'd prefer to future-proof things
    so that, if desired, large files won't choke up the hash

    Instead we'll read it in chunks and preserve some RAM
    """
    xx = xxhash.xxh32()
    BUF_SIZE = (2**10) * 16  # In kibibytes
    buffer = io.BytesIO()
    with open(filename, 'rb') as fh:
        data = True
        while data:
            data = fh.read(BUF_SIZE)
            buffer.write(data)
            xx.update(data)
    buffer.seek(0)
    # For thumbnails, returning the buffer is fine
    # but this could be a RAM bottleneck for larger
    # files
    return xx.hexdigest(), buffer



if __name__ == '__main__':
    image_hash, image_data = load_data(target)
    cached = retrieve(image_hash)
    if not cached:
        _, image_data = thumbnail(target, 300, 500)
        persist(image_hash, image_data)
        cached = retrieve(image_hash)

    with open('/tmp/preview.png', 'wb+') as fh:
        fh.write(cached)
    # save_preview(cached, '/tmp/preview.png')
   # subprocess.run(["img2sixel", "/tmp/preview.png"])
