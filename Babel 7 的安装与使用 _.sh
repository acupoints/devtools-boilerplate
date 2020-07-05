# 从dependencies或devDependencies移除
yarn remove @babel/cli
yarn remove @babel/core
yarn remove @babel/plugin-transform-runtime
yarn remove @babel/polyfill
yarn remove @babel/preset-env
yarn remove @babel/runtime

# 添加到devDependencies
yarn add -D @babel/cli
yarn add -D @babel/core
yarn add -D @babel/plugin-transform-runtime
yarn add -D @babel/polyfill
yarn add -D @babel/preset-env
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
 
## 配置文件 babel.config.js
# module.exports = { presets: [ ... ], plugins: [ ... ] }
#####################################################################

