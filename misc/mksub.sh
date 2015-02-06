
# Shell script generates images suitable for use as a title clip in kdenlive

function gen () {
SIZE=640x480
OUTFILE=`echo $TEXT|tr -cs [a-zA-Z] _`.png

convert \
    -size $SIZE \
    gradient:none-none \
    _$OUTFILE

convert \
    -pointsize 36 \
    -background '#00000066' \
    -fill white \
    -font Times-New-Roman-Bold \
    -strokewidth 0 \
    label:" $TEXT " \
    miff:- | \
    composite -compose over -gravity Center -geometry "+0""+150" - _$OUTFILE $OUTFILE

rm _$OUTFILE

}

TEXT="\"He played upon his hamster\n   wheel\""
gen
TEXT="\"His eyes were made of hamster\n    food\""
gen
TEXT="\"He played upon his wheel\""
gen
TEXT="\"His nose was made of lettuce\""
gen
TEXT="\"His mouth was made of hamster\n   chew toys\""
gen
TEXT="\"And his name was Humphrey\""
gen
