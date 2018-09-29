
##
##  @todo
##  ユーザー名とプロジェクト名を適宜設定する
##

USER_NAME     =  takahiroitou
PROJECT_NAME  =  prmu2016-environment
PACKAGE_NAME  =  ${USER_NAME}/${PROJECT_NAME}

SOURCE_DIR    =  .

##
##  コマンドを実行するには管理者権限が必要
##  以下のいずれかの処置を行う
##    1) ユーザーを docker グループに入れる
##    2) sudo を使う
##
##  この Makefile では DOCKER_CMD の内容で対応
##    1) DOCKER_CMD = docker
##    2) DOCKER_CMD = sudo docker
##

DOCKER_CMD    =  docker
#DOCKER_CMD    =  sudo  docker

build:
	${DOCKER_CMD}  build  -t  ${PACKAGE_NAME} ${SOURCE_DIR}

login:
	${DOCKER_CMD}  run  --rm  -it  ${PACKAGE_NAME}  /bin/bash

run-bg:
	${DOCKER_CMD}  run  --rm  -itd -p 8080:25  ${PACKAGE_NAME}

run:
	${DOCKER_CMD}  run  --rm  -it  -p 8080:25  ${PACKAGE_NAME}

