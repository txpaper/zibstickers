#!/bin/bash

./to_webp.sh
if [ $? -eq 0 ]; then
    ./create_palette.sh
    echo "Uploading palette to remote server... "
    scp palette.png root@192.168.1.101:/var/www/html/zibstickers/palette.png
fi
