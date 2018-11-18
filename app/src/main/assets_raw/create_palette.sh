#!/bin/bash

echo -n "Creating palette... "

now=`date +"%Y-%m-%d %H:%M:%S %Z"`

packs=`ls -d [0-9]`

for pack in $packs; do

    num=`ls $pack/[0-9]*.png | wc -l`
    montage "$pack/[0-9]*.png" -tile 8x -geometry 128x128+20+20 -pointsize 15 -set label '%f\n' -background SkyBlue -title "Pack $pack - $num stickers" "$pack.png"

    if [ $? -ne 0 ]; then
        echo "Error"
        exit 1
    fi

done

#montage "[0-9]*.png" -tile 1x -geometry +0+0 -pointsize 20 -title "LiveBuild $now" palette.png

montage "[0-9]*.png" -tile 1x -geometry +0+0 -pointsize 20 -title "Zib Stickers v0.6 palette" palette-0.6.png

if [ $? -eq 0 ]; then
    echo "Done"
else
    echo "Error"
    exit 2
fi

for i in $packs; do
    rm --verbose "$i.png"
done

exit 0
