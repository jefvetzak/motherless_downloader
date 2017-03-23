#!/bin/bash

#Purpose; download a video from motherless.com to current Directory
#Input: a n internetlink (https:....)

#Creates Date string for appending to file.
D=$(date +%d_%m_%Y)
#creates a temp map, where we can work in. this will be deleted
#Go To Users Home
cd $PATH     
mkdir  tempMSdown
cd tempMSdown
#Download the index.html file
wget --quiet --output-document=index.html $1

#Now we must extract the title & source-url of the video

#sourceUrl
url=$(grep __fileurl index.html | cut -d "'" -f2)

#Now The Title
title=$(grep "<title>" index.html | cut -d "-" -f1 | cut -d ">" -f2)
#move one folder up 
cd ..
#Now the actual Download
wget --output-document="$title-$D.mp4" $url 
#getting the files a  place in hell
rm -f -d -r  tempMSdown

echo "Hope All went  Well, Happy Jacking!"
