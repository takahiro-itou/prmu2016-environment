#!/bin/bash

WORK_DIR=/root/alcon2016

if test  ! -d ${WORK_DIR} ; then
    mkdir  ${WORK_DIR}  ||  exit  $?
fi
pushd  ${WORK_DIR}  ||  exit  $?

mkdir  VirtualDatasets  ||  exit  $?
unzip  ../zip/DatasetGenerator.zip             ||  exit  $?
unzip  ../zip/SampleCodes1_1.zip               ||  exit  $?
unzip  -d VirtualDatasets/  ../zip/Level1.zip  ||  exit  $?
unzip  -d VirtualDatasets/  ../zip/Level2.zip  ||  exit  $?

