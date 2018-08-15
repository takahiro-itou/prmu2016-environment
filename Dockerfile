
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
##  Install python 3.5.1
##

ENV  PYENV_ROOT     /usr/local/pyenv
ENV  PATH           ${PYENV_ROOT}/bin:${PATH}

RUN  apt  -y  install  --no-install-recommends   curl  wget  \
         libssl-dev  libbz2-dev  libreadline-dev  libsqlite3-dev    &&  \
     git  clone  git://github.com/yyuu/pyenv.git  ${PYENV_ROOT}/    &&  \
     git  clone  git://github.com/yyuu/pyenv-virtualenv.git  \
                 ${PYENV_ROOT}/plugins/pyenv-virtualenv

RUN  echo  'eval "$(pyenv init -)"'  |  tee  -a  ${HOME}/.bashrc

RUN  pyenv  install  -v  3.5.1
RUN  pyenv  global       3.5.1

RUN  apt  -y  install  --no-install-recommends  \
         pkg-config  libffi-dev  libfreetype6-dev  \
         libhdf5-dev  liblapack-dev  libpng-dev    \
         libxml2-dev  libxslt1-dev
ADD  ./requirements  /root/requirements

##
##  Set Working directory.
##

WORKDIR  /root/alcon2016

