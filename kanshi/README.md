# Kanshi

The convenience script will output the current output configuration to STDOUT. 

Recommended workflow:

Figure out the resolution and position for each monitor

```
swaymsg -t get_outputs | jq ' .[] | [{"current_mode"}] '
swaymsg -t get_outputs | jq ' .[] | [{"position"}] '
```

Let's say that we have the following output for OUT-1 and OUT-2

```
[
  {
    "rect": {
      "x": 0,
      "y": 0,
      "width": 2560,
      "height": 1440
    }
  }
]
[
  {
    "rect": {
      "x": 2560,
      "y": 0,
      "width": 3840,
      "height": 2400
    }
  }
]
```

This sets the upper left hand corner of OUT-1 as our origin.

This then sets the upper left hand corner of OUT-2 to be 1920 pixels to the left of the origin and 0 pixels down.

To get a friendlier version of the output we can use the `./convenience/get_outputs.py` script

Let's set it so that OUT-2 is our primary and OUT-1 is below it and centered.

> Bear in mind that we have to take scaling into account!

OUT-2 has a scaling factor of 1 while OUT-2 has a scaling factor of 2. So that width is actually 1920 and it's halved value is 960

We need the width of both monitors. Call them w1 and w2. In our above example, w1=1280 and w2=960

To get the origin required to put OUT-1 centered to OUT-2 is w1-w2 or 320. Since we'll just be placing this at the bottom, the y offset is simply the height of the origin's monitor.

```
output OUT-1 position 320 1440
output OUT-2 position 0 0
```

