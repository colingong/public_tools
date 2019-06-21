#!/bin/bash

declare LOG_FILE="jiuxiao_crawler.log"

declare -a files=(
'http://images.examplesite.com/pic1.jpg'
'http://images.examplesite.com/pic2.jpg'
'http://images.examplesite.com/pic3.jpg'
'http://images.examplesite.com/pic4.jpg'
  )


function get_file () {
    cd /root/crawler_img
    curl --max-time 120 -w "%{http_code}" -LO $1    
	}

###
function append_log () {
    echo $1 >> $2    
	}

for i in "${files[@]}"
do
    PROCESS_FILE=$i
    get_file $PROCESS_FILE
    append_log $PROCESS_FILE $LOG_FILE
    # delete_file $PROCESS_FILE
    # rm -f *mp4
    # rm -f *jpg
done
