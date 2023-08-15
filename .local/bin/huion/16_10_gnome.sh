#!/bin/bash
# Set the screen to 16:10 aspect ratio but account for gnome titlebar and top bar
xsetwacom set 'HID 256c:006e Pen stylus' ResetArea
xsetwacom set 'HID 256c:006e Pen stylus' MapToOutput 1352x845+0+69
