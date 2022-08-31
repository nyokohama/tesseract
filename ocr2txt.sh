#!/bin/bash

# Shell script to convert a PDF to TXT using tesseract.

PDF_PATH=$1
FILE_NAME=`basename $PDF_PATH .pdf`
TMP_DIR=tmp_$FILE_NAME

mkdir $TMP_DIR

pdftoppm -png -gray -r 300 $PDF_PATH $TMP_DIR/page

find "./$TMP_DIR" -type f -name "*.png" | sed 's/\.png$//' | xargs -P8 -n1 -I% tesseract %.png % -l eng+jpn

cat $TMP_DIR/*.txt > $FILE_NAME.txt
 
rm -fr  $TMP_DIR