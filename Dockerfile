
FROM  ubuntu:16.04

##
##  Copy and extract ZIP files.
##

ADD  ./files  /root

RUN  apt  update  &&  \
     apt  -y  install  git  unzip  vim  emacs

RUN  /bin/bash  -x  /root/.scripts/setup-data.sh

##
##  Install g++ 5.4
##

RUN  apt  -y  install  --no-install-recommends  g++-5

##
##  Set Working directory.
##

WORKDIR  /root/alcon2016

