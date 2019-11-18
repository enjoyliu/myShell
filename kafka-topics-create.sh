#!/bin/bash

cat src.txt | while read line
do 
    bin/kafka-topics.sh --create --zookeeper 10.221.21.235:2181/databus-kafka --replication-factor 1 --partitions 3 --topic ${line}
done
