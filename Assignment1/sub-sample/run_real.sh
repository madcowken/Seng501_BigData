#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
INPUTFILE=/user/dkrishna/wordcount/shakespeare.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment1/subsample/output

while getopts "m:r:i:o" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
		o) OUTPUTFILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Input file: $INPUTFILE"
echo "Output file: $OUTPUTFILE"

hadoop jar $JARFILE \
 -D mapred.reduce.tasks=0 \
 -files $MAPPER,$REDUCER \
 -mapper $MAPPER \
 -input $INPUTFILE \
 -output $OUTPUTFILE

hadoop fs -getmerge $OUTPUTFILE result.txt
# hadoop fs -rm -r $OUTPUTFILE

