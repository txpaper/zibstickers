#!/bin/bash

echo -n "Creating palette... "

now=`date +"%Y-%m-%d %H:%M:%S %Z"`

montage "[0-9]*.png" -tile 8x -geometry 128x128+20+20 -pointsize 15 -set label '%f\n' -background SkyBlue -title "Zib Stickers\nLive build $now" palette.png

if [ $? -eq 0 ]; then
    echo "Done"
    exit 0
else
    echo "Error"
    exit 1
fi
