npm init -y
npm install -D babel-cli babel-preset-es2015
echo '{ "presets": ["es2015"] }' > .babelrc

npm i -D uglify-es

### package.json Scripts 属性添加以下脚本
############################################################################
    "babel": "./node_modules/.bin/babel browser.js -d build/",
    "uglify": "./node_modules/.bin/uglifyjs build/browser.js -o build/browser.min.js",
    "build": "npm run babel && npm run uglify"
############################################################################

## ES6 转译 ES5
npm run babel
## 删除ES5脚本中的空格
npm run uglify

## 也可以组合调用
npm run build
