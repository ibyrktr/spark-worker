FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive
ENV SPARK_VERSION=2.1.1
ENV HADOOP_VERSION=2.7

ENV SPARK_HOME /opt/apache-spark
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_WORKER_WEBUI_PORT 8089
ENV SPARK_MASTER_URL spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT}

RUN apt-get update && \
    apt-get install -y wget supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.proserve.nl/spark/spark-"$SPARK_VERSION"/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz \
    -O /tmp/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz && \
    mkdir "$SPARK_HOME" && \
    tar zxvf /tmp/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz -C "$SPARK_HOME" --strip 1 && \
    rm /tmp/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz
 
ADD spark-worker-supervisor.conf /etc/supervisor/conf.d/
ADD start-spark-worker.sh "$SPARK_HOME"/sbin/start-spark-worker.sh
RUN chmod 755 "$SPARK_HOME"/sbin/start-spark-worker.sh

EXPOSE 8089
CMD ["supervisord", "-n"]