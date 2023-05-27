#!/usr/bin/env python3

from psutil import sensors_battery
from datetime import datetime
import humanreadable as hr


#print(hr.Time(datetime.now(), default_unit=hr.Time.Unit.SECOND))

battery_status = sensors_battery()

pct = str(int(battery_status.percent))
"""
battery-full        \uf240
battery-bolt        \uf376

"""
battery_icon = u"\uf240"
if battery_status[2]:
    battery_icon = u'\uf376'
print(datetime.now().strftime("%Y-%m-%d %I:%M%p  ") + battery_icon + ' ' + pct + '%')
