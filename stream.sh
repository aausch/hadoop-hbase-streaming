#!/bin/bash
sudo -u hdfs hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.1.2.jar \
  -files map.py,reduce.py \
  -libjars build/hadoop-hbase-streaming.jar,/usr/lib/hbase/hbase.jar \
  -D map.input.table=visit -D map.input.columns=details -D map.input.timestamp=1 -D map.input.binary=0 \
  -D reduce.output.table=counter \
  -input dummy_input -inputformat org.childtv.hadoop.hbase.mapred.JSONTableInputFormat \
  -output dummy_output -outputformat org.childtv.hadoop.hbase.mapred.ListTableOutputFormat \
  -mapper map.py -reducer reduce.py
