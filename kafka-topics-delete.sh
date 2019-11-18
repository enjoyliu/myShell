#!/bin/bash

cat src.txt | while read line
do 
    bin/kafka-topics.sh --delete --zookeeper 10.221.21.235:2181/databus-kafka --topic ${line}
done
