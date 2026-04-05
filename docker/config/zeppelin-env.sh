#!/bin/bash
export JAVA_HOME=/opt/java/openjdk
export HADOOP_HOME=/opt/hadoop
export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
export PIG_HOME=/opt/pig
export ZEPPELIN_ADDR=0.0.0.0
export ZEPPELIN_PORT=8080
export MASTER=local[*]
export HADOOP_CLASSPATH=/opt/hadoop/share/hadoop/common/*:/opt/hadoop/share/hadoop/common/lib/*:/opt/hadoop/share/hadoop/hdfs/*:/opt/hadoop/share/hadoop/hdfs/lib/*:/opt/hadoop/share/hadoop/yarn/*:/opt/hadoop/share/hadoop/yarn/lib/*:/opt/hadoop/share/hadoop/mapreduce/*:/opt/hadoop/share/hadoop/mapreduce/lib/*
export CLASSPATH=$HADOOP_CLASSPATH
