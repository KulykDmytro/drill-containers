#!/bin/bash

PROJECT=drill
OS=ubuntu
VERSION_ARG=$1

if [[ ${VERSION_ARG} == "" ]]
then
  if [[ ${VERSION_ENV} == "" ]]
  then
    echo "Please enter the Drill VERSION string. For ex: 1.14.0"
    exit -1
  else
    VERSION_ARG=VERSION_ENV
  fi
fi

docker build --build-arg VERSION_ARG=${VERSION_ARG} -t ${PROJECT}:${VERSION_ARG}-${OS} .

if [[ $? -eq 0 ]]
then
  docker tag ${PROJECT}:${VERSION_ARG}-${OS} agirish/${PROJECT}:${VERSION_ARG}-${OS}
  docker push agirish/${PROJECT}:${VERSION_ARG}-${OS}
fi