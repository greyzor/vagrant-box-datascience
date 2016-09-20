#/bin/bash

## Install Java
apt-get update
apt-get install -y default-jre default-jdk

## Install Spark
cd /tmp
wget http://apache.trisect.eu/spark/spark-1.6.2/spark-1.6.2-bin-hadoop2.6.tgz
tar -xvzf spark-1.6.2-bin-hadoop2.6.tgz

SPARK_HOME="/tmp/spark-1.6.2-bin-hadoop2.6"
echo export SPARK_HOME=$SPARK_HOME >> ~/.bashrc
echo export PYTHONPATH=$SPARK_HOME/python/:'$PYTHONPATH' >> ~/.bashrc
echo export PYSPARK_SUBMIT_ARGS='"--master spark://spark-master:7077 --packages com.databricks:spark-csv_2.10:1.4.0 pyspark-shell"' >> ~/.bashrc
echo export PYSPARK_PYTHON=/usr/bin/python2.7 >> ~/.bashrc

## Install other dependencies
pip install py4j
