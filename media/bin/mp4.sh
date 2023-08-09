#!/bin/bash

_process_video() {
  DIR="video/$1"
  INPUT="mp4/$1.mp4"
  PRESET=fast

  echo $DIR
  echo $INPUT

  rm -rf $DIR
  mkdir -p $DIR

  ffmpeg -i $INPUT \ 
    -ss 00:00:00 -vframes 1 -y "$DIR/poster.jpg"
  
  ffmpeg -i $INPUT \
    -c:v libx264 -preset $PRESET -crf 23 -r 30 -c:a aac -b:a 128k \
    -vf "scale=-2:360" -b:v 1000k "$DIR/360p.mp4"
  
  ffmpeg -i $INPUT \
    -c:v libx264 -preset $PRESET -crf 23 -r 30 -c:a aac -b:a 128k \
    -vf "scale=-2:480" -b:v 2000k "$DIR/480p.mp4"
  
  ffmpeg -i $INPUT \
    -c:v libx264 -preset $PRESET -crf 23 -r 30 -c:a aac -b:a 128k \
    -vf "scale=-2:720" -b:v 5000k "$DIR/720p.mp4"

}

for file in mp4/*; do
  file_name=$(basename $file)
  _process_video "${file_name%.*}"
done