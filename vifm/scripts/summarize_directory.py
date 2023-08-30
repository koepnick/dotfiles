#!/usr/bin/env python3
import sys
import os


from glob import iglob, glob
from filetypes import FILETYPES

def sizeof(num, suffix="B"):
    for unit in ("", "Ki", "Mi", "Gi", "Ti", "Pi", "Ei", "Zi"):
        if abs(num) < 1024.0:
            return f"{num:3.1f}{unit}{suffix}"
        num /= 1024.0
    return f"{num:.1f}Yi{suffix}"



dir_name = sys.argv[1]
max_width = int(sys.argv[2])

output = ""

# Use an iterator
filetree = glob(r'**/*', recursive=True, root_dir=dir_name)
videos = {}
total_video_size = 0
total_image_size = 0

output += FILETYPES['video']['icon']
for video_type in FILETYPES['video']['extensions']:
    video_size = 0
    filtered = list(filter(lambda x: x.lower().endswith(video_type), filetree))
    for file_name in filtered:
        full_name = os.path.join(dir_name, file_name)
        video_size += os.path.getsize(full_name)
    # total_size = list(map(lambda x: os.path.getsize(os.path.join(dir_name, x)), filtered))

    if video_size > 0:
        output += f"\n  {video_type}: {sizeof(video_size)} in {len(filtered)} files"
        total_video_size += video_size

output += f"\nVideo total: {sizeof(total_video_size)}"

seperator = '\n' + ('.' * max_width) + '\n'
output += seperator
output += FILETYPES['image']['icon']
for image_type in FILETYPES['image']['extensions']:
    image_size = 0
    filtered = list(filter(lambda x: x.lower().endswith(image_type), filetree))
    for file_name in filtered:
        full_name = os.path.join(dir_name, file_name)
        image_size += os.path.getsize(full_name)
    # total_size = list(map(lambda x: os.path.getsize(os.path.join(dir_name, x)), filtered))

    if image_size > 0:
        output += f"\n  {image_type}: {sizeof(image_size)} in {len(filtered)} files"
        total_image_size += image_size

output += f"\nImage total: {sizeof(total_image_size)}"
print(output)

# [print(i) for i in next(filetree)]
