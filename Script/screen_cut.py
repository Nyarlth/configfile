#!/bin/python3

import os
import datetime
import re
filename = str(datetime.datetime.now()).split('.')[0].replace(' ','_')
patern = "(.*),(.*) (.*)x(.*)"
size = os.popen('slurp', 'r').read().replace("\n","")
z = re.match(patern,size)
x,y = int(z.group(1)), int(z.group(2))
_x,_y = int(z.group(3)),int(z.group(4))
x+=2
y+=2
_x -=4 
_y -=4
os.system(f'grim -g "{x},{y} {_x}x{_y}" ~/Pictures/Capture/"{filename}.png"')


os.system(f'wl-copy < ~/Pictures/Capture/"{filename}".png')
os.system(f'echo ~/Pictures/Capture/"{filename}".png > ~/Pictures/Capture/.cache')

os.system("notify-send 截图一张")
