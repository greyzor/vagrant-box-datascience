#!/bin/bash

docker run --rm -it -p 8888:8888 --link spark-master:spark-master continuumio/miniconda /bin/bash
