from PIL import Image, ImageFilter, UnidentifiedImageError
import os
import math
import sys

def create_image_montage(directory, output='/tmp/thumbs/montage.png'):
    # Get a list of all image file paths in the directory
    images = [os.path.join(directory, img) for img in os.listdir(directory) if img.endswith((".png", ".jpg", ".jpeg"))]

    # Open all images
    img_open = []
    for img in images:
        try:
            opened_image = Image.open(img).convert('RGBA')

            # Apply sharpen filter to the image
            sharpened_image = opened_image.filter(ImageFilter.SHARPEN)
            
            img_open.append(sharpened_image)
        except UnidentifiedImageError:
            print(f'Warning: Could not open image {img}. It might be corrupted.')
        except OSError:
            print(f"Couldn't open the image")

    # Calculate montage size (square layout), and resize images if necessary
    montage_size = math.ceil(math.sqrt(len(img_open)))
    max_size = 128 #max((i.width, i.height) for i in img_open)

    for i in range(len(img_open)):
        if img_open[i].width != max_size or img_open[i].height != max_size:
            img_open[i] = img_open[i].resize((max_size, max_size))

    # Create blank canvas for montage
    montage_image = Image.new(mode='RGBA', size=(montage_size*max_size, montage_size*max_size))

    # Paste images into montage
    for i in range(len(img_open)):
        montage_image.paste(img_open[i], (max_size*(i%montage_size), max_size*(i//montage_size)))

    # Save montage to output path
    montage_image.save(output)

if __name__ == '__main__':
    create_image_montage(sys.argv[1])

