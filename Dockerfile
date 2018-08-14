
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

RUN  apt  -y  install  --no-install-recommends  make  &&  \
     update-alternatives  --install                       \
              /usr/bin/gcc   gcc   /usr/bin/gcc-5  54     \
     --slave  /usr/bin/g++   g++   /usr/bin/g++-5         \
     --slave  /usr/bin/gcov  gcov  /usr/bin/gcov-5

##
##  Set Working directory.
##

WORKDIR  /root/alcon2016

