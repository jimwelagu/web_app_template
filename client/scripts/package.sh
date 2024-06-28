#!/bin/bash

WORKDIR=$(pwd)

cd ${WORKDIR}/src/
echo "installing packages"
npm install
echo "node type"
npm i -D @types/node
echo "buiilding"
npm run build
pwd
ls
mkdir dist
cp -r ./*.js dist/
cp -r ./*.css dist/
cp -r ./*.svg dist/
ls
# cd dist
# zip -r ${WORKDIR}/../add_task_lambda_function.zip .
