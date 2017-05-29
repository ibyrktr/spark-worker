#!/bin/bash

echo "Spark home: " $SPARK_HOME 							#/opt/apache-spark
echo "Spark master url: " $SPARK_MASTER_URL
echo "Spark master webui port: " $SPARK_MASTER_WEBUI_PORT	#8088

cd $SPARK_HOME && ./bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT \
    $SPARK_MASTER_URL