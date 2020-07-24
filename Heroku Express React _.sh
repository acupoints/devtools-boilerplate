npx express-generator express_server
cd express_server/
ls -al

npm i -S heroku-ssl-redirect
## app.js
# var logger = require('morgan');
const sslRedirect = require('heroku-ssl-redirect')

# app.use(logger('dev'));
app.use(sslRedirect())


npm install
npm start
# http://localhost:3000/


npx create-react-app react_client
cd react_client/
ls -al
rm -rf .git

yarn eject

## react_client/config/paths.js
module.exports = {
  dotenv: resolveApp('.env'),
  appPath: resolveApp('.'),
  // appBuild: resolveApp('build'),
  appBuild: resolveApp('../public'),
  // ...
}

## react_client/public/index.html
    <!-- <link rel="manifest" href="%PUBLIC_URL%/manifest.json" /> -->

yarn build


## Load home page
## routes/testAPI.js
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send("respond with a resource from API")
});

module.exports = router;

## app.js
# var indexRouter = require('./routes/index');
# var usersRouter = require('./routes/users');
const testAPIRouter = require('./routes/testAPI')

# app.use('/', indexRouter);
# app.use('/users', usersRouter);
app.use('/testAPI', testAPIRouter)

## react_client/src/App.js
# import React from 'react';
import React, { Component } from 'react'

## Replace rendering function with class
class App extends Component {
    constructor(props) {
        super (props)
        this.state = {
            apiResponse: ""
        }
    }
    callAPI () {
        fetch("/testAPI")
            .then(res => res.text())
            .then(res => this.setState({apiResponse: res}))
            .catch(err => err)
    }
    componentDidMount () {
        this.callAPI()
    }
    render() {
        return (
            <div className="App">
                <header className="App-header">
                    <img src={logo} className="App-logo" alt={logo} />
                    <h1 className="App-title">Welcome to React</h1>
                </header>
                <p className="App-intro">{this.state.apiResponse}</p>
            </div>
        )
    }
}

## Configure the external environment
## Create 2 required files
touch .gitignore
echo node_modules/>>.gitignore
echo react_client/node_modules/>>.gitignore

touch Procfile
echo web: node ./bin/www>>Procfile

## Specify engine version
  # },
  "engines": {
    "node": "12.16.3",
    "npm": "6.14.4"
  }

