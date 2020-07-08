# 从dependencies或devDependencies移除
npm uninstall -D @babel/cli
npm uninstall -D @babel/core
npm uninstall -D @babel/plugin-transform-runtime
npm uninstall -D @babel/polyfill
npm uninstall -D @babel/preset-env
npm uninstall -D @babel/preset-react
npm uninstall -D @babel/runtime

# 添加到devDependencies
npm install -D @babel/cli
npm install -D @babel/core
npm install -D @babel/plugin-transform-runtime
npm install -D @babel/polyfill
npm install -D @babel/preset-env
npm install -D @babel/preset-react
npm install -D @babel/runtime

# 从dependencies或devDependencies移除
yarn remove -D @babel/cli
yarn remove -D @babel/core
yarn remove -D @babel/plugin-transform-runtime
yarn remove -D @babel/polyfill
yarn remove -D @babel/preset-env
yarn remove -D @babel/preset-react
yarn remove -D @babel/runtime

# 添加到devDependencies
yarn add -D @babel/cli
yarn add -D @babel/core
yarn add -D @babel/plugin-transform-runtime
yarn add -D @babel/polyfill
yarn add -D @babel/preset-env
yarn add -D @babel/preset-react
yarn add -D @babel/runtime

## 根目录创建配置文件 babel.config.js
## 一般库或工具中使用@babel/runtime，因为它可以避免全局的污染。
## 如果是项目中可以直接使用@babel/polyfill或者在@babel/preset-env中配置useBuiltIns = usage
# // webpack.config.js
# module.exports = {
#  entry: ["@babel/polyfill", "./app.js"],
# }

// babel.config.js
module.exports = {
    presets: [
      "@babel/preset-env",
      {
        useBuiltIns: 'usage',
        // targets: {
        //   edge: "17",
        //   firefox: "60",
        //   chrome: "67",
        //   safari: "11.1",
        // },
        debug: true,
      }
    ],
    plugins: [
    //   "@babel/plugin-transform-runtime",
    //   {
    //     "corejs": false,
    //     "helpers": true,
    //     "regenerator": true,
    //     "useESModules": false,
    //   },
    ]
}

### Babel 7 支持三种配置方式
#####################################################################
## 配置文件 package.json
# { .... "babel": { "presets": [...], "plugins": [...] } }
 
## 配置文件 .babelrc
# {     "presets":[ ... ], "plugins":[ ... ] }
{
    "presets": ["@babel/preset-env", "@babel/preset-react"]
}
## 配置文件 babel.config.js
# module.exports = { presets: [ ... ], plugins: [ ... ] }
#####################################################################

### 异常处理
## gyp ERR! configure error
## gyp ERR! stack Error: Command failed: C:\Python37\python.EXE -c import sys; print "%s.%s.%s" % sys.version_info[:3];
## gyp ERR! stack   File "<string>", line 1
## gyp ERR! stack     import sys; print "%s.%s.%s" % sys.version_info[:3];
## gyp ERR! stack                                ^
## gyp ERR! stack SyntaxError: invalid syntax
## 
## =============================================================
python-2.7.18.amd64.msi
npm install node-pre-gyp -g

npm install --global node-gyp@latest
for /f "delims=" %P in ('npm prefix -g') do npm config set node_gyp "%P\node_modules\node-gyp\bin\node-gyp.js"


