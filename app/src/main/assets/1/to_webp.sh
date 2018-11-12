 #!bin/bash
 # enrico `txpaper' ronconi
 # 2018-11-10

command -v cwebp > /dev/null
if [ $? -ne 0 ]; then
    echo "pleas install cwebp"
    exit 1
fi
 
files=`ls *.png | grep '^[0-9]\{2,2\}.\{1,\}\.png'`
modif=0

function create_webp {
    cwebp -quiet -q 80 $1.png -o $1.webp >> /dev/null
}

for f in $files;
do
    name="${f%.*}"
    #echo $name
    if [ ! -f "$name.webp" ]; then
        echo "$name.webp not found, creating..."
        create_webp $name
        modif=$(($modif+1))
    elif [ "$name.webp" -nt "$name.png" ]; then
        echo "$name.webp is up to date"
    else
        echo "$name.png was changed, updating $name.webp"
        create_webp $name
        modif=$(($modif+1))
    fi
done

echo -e "\n$modif file updated"
if [ $modif -eq 0 ]; then
    exit 1
else
    exit 0
fi
