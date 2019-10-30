#!/bin/bash
jdk8="/usr/local/jdk8"

tar zxf kafka_2.11-2.1.0.tgz
mkdir -p /data/kafka_2.11-2.1.0
mv kafka_2.11-2.1.0/* /data/kafka_2.11-2.1.0

host=$2
mkdir -p /data/kafka_2.11-2.1.0/config/databus-kafka
kafka_conf="/data/kafka_2.11-2.1.0/config/databus-kafka/server.properties" 
zk_path="$2:2181,$2:2181,$2:2181"
echo "broker.id=$1">$kafka_conf
echo "host.name=$host">>$kafka_conf
echo "zookeeper.connect=$zk_path/databus-kafka">>$kafka_conf
echo 'num.network.threads=4
num.io.threads=4
socket.send.buffer.bytes=1024000
socket.receive.buffer.bytes=1024000
socket.request.max.bytes=52428800
log.dirs=/data/lib/kafka/kafka_platform
num.partitions=2
num.recovery.threads.per.data.dir=1
log.cleanup.policy=delete
log.retention.hours=24
log.segment.bytes=536870912
log.retention.check.interval.ms=300000
log.cleaner.enable=false
zookeeper.connection.timeout.ms=6000
default.replication.factor=2
#delete.topic.enable=true
auto.create.topics.enable=true'>>$kafka_conf
### start by supervisor
apt-get install -y supervisor
supervisor_path=/etc/supervisor/conf.d/kafka.conf

echo '[program:kafka]
command=/data/kafka_2.11-2.1.0/bin/kafka-server-start.sh /data/kafka_2.11-2.1.0/config/databus-kafka/server.properties
user=root
autostart=false
autorestart=true
startretries=10
exitcodes=0
stopsignal=KILL
stopwaitsecs=10
stdout_logfile=/data/log/kafka/databus/stdout.log
stderr_logfile=/data/log/kafka/databus/stderr.log
stdout_logfile_maxbytes=100MB
stdout_logfile_backups=5
stderr_logfile_maxbytes=100MB
stderr_logfile_backups=5
environment=JAVA_HOME="/usr/local/jdk8",KAFKA_JMX_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=$2 -Djava.net.preferIPv4Stack=true",JMX_PORT="7072"
