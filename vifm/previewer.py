#!/bin/env python3

import os
import argparse
from pprint import pprint

parser = argparse.ArgumentParser(description='Vifm Previewer')
parser.add_argument('--dir')
parser.add_argument('--files')
parser.add_argument('--rel-dir')
parser.add_argument('--x')
parser.add_argument('--y')
parser.add_argument('--w')
parser.add_argument('--h')
kargs, uargs = parser.parse_known_args()

# IOU some kind of preview for multiple selected file

# out = os.system("date +'%s'")
out_file = kargs.files
out_dir = kargs.dir
out_path = os.path.join(out_dir, out_file)
out = os.system(f"imgcat '{out_path}'")

print(out)
# print(kargs)
# print(uargs)
# file = None
# if len(files) == 1:
#     file = files[0]
#
# print(file)
# for file in files: print(file)
#print(args.rel_dir)

# for i in enumerate(sys.argv):
    # print(i)
