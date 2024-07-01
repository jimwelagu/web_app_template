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
# mkdir dist
# cp -r ./*.js dist/
# cp -r ./*.css dist/
# cp -r ./*.svg dist/
# ls
# cd dist
# zip -r ${WORKDIR}/../add_task_lambda_function.zip .

# mkdir dist
# cp -r ./*.js dist/
# cp -r ./node_modules dist/
# cd dist
# zip -r ${WORKDIR}/../post_confirmation_lambda_function.zip .
