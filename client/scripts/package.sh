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
echo ls 2
ls ../
echo ls 3
ls ../build/
cd ../build/
zip -r ${WORKDIR}/../client.zip .

# mkdir dist
# cp -r ./*.js dist/
# cp -r ./node_modules dist/
# cd dist
# zip -r ${WORKDIR}/../post_confirmation_lambda_function.zip .
