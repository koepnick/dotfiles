#!/usr/bin/env python3

import subprocess

def generate_html_content():
    # Generate your HTML content dynamically
    html_content = "<p>Hello, SwayWM!</p>"
    return html_content

def update_swaybar_content(html_content):
    swaymsg_cmd = f'swaymsg "bar dashboard reload; bar dashboard command swaybar -i id=dashboard -s \"Testing\""'
    subprocess.run(swaymsg_cmd, shell=True)

if __name__ == "__main__":
    html_content = generate_html_content()
    update_swaybar_content(html_content)
