Here you can find a few of my cryptocurrency mining scripts for Windows.

- GUI mining app.ahk
A simple GUI that allows to start mining on different devices as well as controling mining intensity without opening .bat files (useful for making the system more responsive at a compromise of speed when user active on the computer).
Some parts of the script have never been finished
You'll need to do quite a bit of work adapting the code to your requrement, but the overall design is there

- Start mining when user idle.ahk
A script that automatically starts mining when user is away from the computer for some time

- Have a break from mining.ahk
A script that stops mining every so often to let the computer rest (not sure if it's of any use)

- Protect GPU against overheating.py
Simple python script that shuts off the computer if the GPU temps reach a particular threshold

Notes
--------
* The latter two scripts are experimental and haven't really been used much.
* As far as I remember launching .bat files directly through AHK didn't work for the .bat files that were calling other .dll or .exe files, that's why I'm simply running them by pasting the file path through Win+R
