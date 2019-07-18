#!/bin/bash

#Simple and stupid script to (re)generate image data. Needs an Unix-ish environment with
#ImageMagick and xxd installed.

convert img16x16.jpeg img16x16.rgb

OUTF="../anim_16x16.c"

echo '//Auto-generated' > $OUTF
echo 'static const unsigned char myanim[]={' >> $OUTF
{
	cat img16x16.rgb
} | xxd -i >> $OUTF
echo "};" >> $OUTF
echo 'const unsigned char *anim=&myanim[0];' >> $OUTF
