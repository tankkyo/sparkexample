#!/bin/bash

FWD="$(cd "`dirname "$0"`";cd ..;pwd)"

SPARK_HOME=/Users/zheng.tan/Softwares/spark-2.1.0-bin-hadoop2.7 # change this to your spark home

if [ -z "$SPARK_HOME" ]; then
     echo "SPARK_HOME is not set, Please set SPARK_HOME first" 1>&2
     exit -1
fi

"$SPARK_HOME"/bin/spark-submit \
    --master yarn \
    --deploy-mode cluster \
    --class org.apache.spark.examples.SparkPi \
    --name sparkpi \
    --driver-memory 1g \
    --driver-cores 1 \
    --executor-memory 1g \
    --executor-cores 1 \
    --num-executors 1 \
    --conf spark.pi.iterators=50000 \
    --conf spark.pi.slice=10 \
    --queue default \
    "$FWD"/target/examples-0.1-SNAPSHOT-jar-with-dependencies.jar # automatically upload this file to hdfs and can be reached by all worker nodes