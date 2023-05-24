#!/usr/bin/env python3

from psutil import sensors_battery
from datetime import datetime
import humanreadable as hr


#print(hr.Time(datetime.now(), default_unit=hr.Time.Unit.SECOND))

battery_status = sensors_battery()

pct = str(int(battery_status.percent))

print(datetime.now().strftime("%Y-%m-%d") + " " + pct + '%')
