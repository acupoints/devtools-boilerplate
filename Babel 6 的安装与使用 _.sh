## 参考文档
## https://babeljs.io/docs/en/6.26.3/babel-preset-es2015

## 简易操作步骤
## STEP 01
# 生成package.json
yarn init -y

## STEP 02
# 安装 Babel 6
yarn add -D babel-cli babel-preset-es2015

## STEP 03
# 配置 Babel 6
# echo '{ "presets": ["es2015"] }' > .babelrc
echo -e '{\n\t"presets": ["es2015"]\n}' > .babelrc

## STEP 04
# 运行 Babel 6
./node_modules/.bin/babel-node index.js

## 也可以为package.json创建一个执行脚本build
#  "scripts": {
#    "build": "./node_modules/.bin/babel-node index.js"
#  }
# 输入简短的命令来执行
# yarn build
