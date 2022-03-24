#!/bin/bash

read -e -p "Enter target filename, use tab for completion: " INPUT_FILE
echo $INPUT_FILE "Selected"
read -e -p "Enter Output filename: " OUTPUT_FILE
echo $OUTPUT_FILE "Selected" 
touch $OUTPUT_FILE
echo "KTHANID SWEEP STARTED..."
date | tee $OUTPUT_FILE
cat $INPUT_FILE | while read input_read
do
	fping -a -r 0 -g "$input_read" >> $OUTPUT_FILE & 
wait
h=$(cat $OUTPUT_FILE | wc -l)
echo $h "ACTIVE HOSTS!"
wait
done
