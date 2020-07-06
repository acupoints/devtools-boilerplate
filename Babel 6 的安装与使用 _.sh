npm init -y
npm install -D babel-cli babel-preset-es2015
echo '{ "presets": ["es2015"] }' > .babelrc

## 配置package.json的scripts.babel
"babel": "./node_modules/.bin/babel-node index.js"
npm run babel

# yarn init -y
# yarn add -D babel-cli babel-preset-es2015
# echo '{ "presets": ["es2015"] }' > .babelrc
## 配置package.json的scripts.babel
## "babel": "./node_modules/.bin/babel-node index.js"
# yarn run babel
