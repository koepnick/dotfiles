#!/usr/bin/env python3

import subprocess
import json
from pprint import pprint

result = subprocess.run(['swaymsg', '-t', 'get_outputs'], stdout=subprocess.PIPE)
displays = json.loads(result.stdout)

for display in displays:
    #pprint(display)
    name = display['name']
    make = display['make']
    serial = display['serial']
    model = display['model']
    x = display['rect']['x']
    y = display['rect']['y']
    height = display['current_mode']['height']
    width = display['current_mode']['width']
    scale = display['scale']
    primary = display['primary']
    transform = display['transform']
    adaptive_sync = display['adaptive_sync_status']
    refresh = float(display['current_mode']['refresh']) / 1000

    print(f"  Make: {display['make']} {display['model']}")
    print(f"  Serial: {serial}")
    print(f"  System Name: {name}")
    print(f"  Mode: {display['current_mode']['height']}x{display['current_mode']['width']} @ {display['current_mode']['refresh']}Hz")
    print(f"  Position: {width}x{height} ({x}, {y})")
    print("\n\n")
    print("-"*80)
    print ("profile abcd {")
    print(f"  output \"{make} {model} {serial}\"")
    print(f"  resolution {width}x{height}@{refresh}Hz") 
    print(f"  position {x}, {y}") 
    print(f"  scale {scale}") 
    print(f"  adaptive_sync {adaptive_sync}")
    print(f"  transform {transform}")
    print(f"  primary {primary}")
    print("}")
    print("-"*80,'\n\n')
