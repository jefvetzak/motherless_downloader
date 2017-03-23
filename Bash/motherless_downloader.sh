#!/bin/bash

#Purpose; download a video from motherless.com to current Directory
#Input: an motherless.com link from a videopage (https:....)

#Creates Date string for appending to file.
D=$(date +%d_%m_%Y)
#creates a temp map, where we can work in. this will be deleted
#Go To current pad
cd $PATH     
mkdir  tempMsDown
cd tempMsDown
#Download the index.html file
wget --quiet --output-document=index.html $1

#Now we must extract the title & source-url of the video

#sourceUrl
url=$(grep __fileurl index.html | cut -d "'" -f2)

#Now The Title
title=$(grep "<title>" index.html | cut -d ">" -f2 | cut -d "<" -f1)
#Now we got somethinh like: title - motherless.COM
#ncount for - m... =17
TotalLength=$(echo ${#title})
TitleLength=$(expr $TotalLength -17)
title=$(echo ${$title:0:$TitleLength})


#Let's now get rid of them ugly whitespaces & replace them with underscores
Title=${title// /_} 
#move one folder up 
cd ..
#Now the actual Download
wget --output-document="$Title_$D.mp4" $url 
#getting the files a nice place in the void
rm -f -d -r  tempMsDown
#Try to keep it gender neutral
echo "Happy Masturbating"
