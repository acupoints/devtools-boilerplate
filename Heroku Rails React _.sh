rails new rails_server --database=postgresql
cd rails_server/
ls -al

## config\database.yml
# development:
#   <<: *default
#   database: myapp_development
  username: postgres
  password: Umph2014

# test:
#   <<: *default
#   database: myapp_test
  username: postgres
  password: Umph2014

rails db:create
rails server
# http://localhost:3000/
# Use Ctrl-C to stop

rails generate controller Hello index

## config\routes.rb
  # get 'hello/index'
  root 'hello#index'

rails server
# http://localhost:3000/
# Use Ctrl-C to stop

npx create-react-app react_client
cd react_client/
ls -al
rm -rf .git

yarn eject

## react_client\config\paths.js
module.exports = {
  dotenv: resolveApp('.env'),
  appPath: resolveApp('.'),
  // appBuild: resolveApp('build'),
  appBuild: resolveApp('../public'),
  // ...
}

## react_client\public\index.html
    <!-- <link rel="manifest" href="%PUBLIC_URL%/manifest.json" /> -->

yarn build

rails server
# http://localhost:3000/
# Use Ctrl-C to stop

## Load home page

## Configure the external environment
## Create 4 required files
touch .gitignore
echo react_client/node_modules/>>.gitignore

touch .env
echo RACK_ENV=development>>.env
echo PORT=3000>>.env

touch Procfile
echo web: bundle exec puma -t 5:5 -p \${PORT:-3000} -e \${RACK_ENV:-development}>>Procfile


