# heroku run sequelize db:migrate --env production --app thawing-savannah-05532
heroku run sequelize db:migrate --env production --app <your Settings App Name>
##
$ heroku login
heroku: Press any key to open up the browser to login or q to exit:
Opening browser to https://cli-auth.heroku.com/auth/cli/browser/bd793dec-e2a1-4a08-ad26-4006dee4a6e2
Logging in... done
Logged in as acupoints672@gmail.com

literal@artemisia MINGW64 ~/Desktop/0804/heroku-node-boilerplate (master)
$ npm i
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.1.3 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.1.3: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

up to date in 6.692s

literal@artemisia MINGW64 ~/Desktop/0804/heroku-node-boilerplate (master)
$ heroku run sequelize db:migrate --env production --app thawing-savannah-05532
 »   Warning: env flag production appears invalid. Avoid using ';' in values.
Running sequelize db:migrate on ⬢ thawing-savannah-05532... up, run.3732 (Hobby)

Sequelize CLI [Node: 12.16.3, CLI: 6.2.0, ORM: 6.3.4]

Loaded configuration file "fyrest/config/config.json".
Using environment "production".
== 20200803135044-create-user: migrating =======
== 20200803135044-create-user: migrated (0.047s)

== 20200803135045-create-profile: migrating =======
== 20200803135045-create-profile: migrated (0.018s)


literal@artemisia MINGW64 ~/Desktop/0804/heroku-node-boilerplate (master)
$
