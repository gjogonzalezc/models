#!/bin/bash

rm /tmp/mnist-spark-pipeline.zip

sbt "runMain pipeline_train" 
