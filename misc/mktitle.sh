#!/bin/bash
# Shell script generates images suitable for use as a centered title clip in kdenlive

function gen () {
SIZE=640x480
OUTFILE=''
FILES=''

count=0
while [ "x${TEXT[count]}" != "x" ]
do
    i=${TEXT[count]}
    OFILE=`echo $i|tr -cs [a-zA-Z] _`.png
    convert \
        -pointsize 36 \
        -background none \
        -fill white \
        -font Times-New-Roman-Bold \
        -strokewidth 0 \
        label:" $i " \
        miff:- | convert - $OFILE
    OUTFILE=$OUTFILE$OFILE
    FILES="$FILES $OFILE"
    count=$(( $count + 1 ))
done

convert \
    -size $SIZE \
    gradient:none-none \
    _$OUTFILE

convert -gravity Center -background none $FILES -append - | \
    composite -compose over -gravity Center -geometry "+0""+0" - _$OUTFILE $OUTFILE
rm _$OUTFILE $FILES

}

TEXT=(
"20141231_91382\n\n"
"December 31 2014\n\n"
"description"
)
gen
