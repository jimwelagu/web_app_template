#!/bin/bash

WORKDIR=$(pwd)/..

cd ${WORKDIR}/functions/addTask
echo "installing packages"
npm install
echo "node type"
npm i -D @types/node
echo "buiilding"
npm run build
mkdir dist
cp -r ./*.js dist/
cp -r ./node_modules dist/
cd dist
zip -r ${WORKDIR}/add_task_lambda_function.zip .

# cd ${WORKDIR}/functions/postConfirmation
# npm install
# npm run build
# mkdir dist
# cp -r ./*.js dist/
# cp -r ./node_modules dist/
# cd dist
# zip -r ${WORKDIR}/post_confirmation_lambda_function.zip .

