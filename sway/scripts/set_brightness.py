#!/usr/bin/env python
import sys

with open('/sys/class/backlight/intel_backlight/brightness', 'rb') as fh: 
    current_value = fh.read()

print(current_value)
if sys.argv[1] == 'up':
    next_value = int(current_value) + int(sys.argv[2])
    if next_value > 255:
        next_value = 255
elif sys.argv[1] == 'down':
    next_value = int(current_value) - int(sys.argv[2])
    if next_value < 0:
        next_value = 0
else:
    next_value = 128
data = None

with open('/sys/class/backlight/intel_backlight/brightness', 'wb') as fh: 
    fh.write(str(next_value).encode())

print(next_value)
