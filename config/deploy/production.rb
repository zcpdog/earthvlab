set :whenever_environment, 'production'
server "222.29.118.245", :web, :db, :app, :primary => true
set :user, "pku"
set :rails_env, "production"
set :application, 'earthvlab'
set :deploy_to,   "/home/pku/var/www/apps/#{application}"
set :db_user,        "root"
set :db_password,    "vgeo3225"
set :db_encoding,    "utf8"
set :db_adapter,     "mysql2"
set :remote_db_name,  "#{application}_#{rails_env}"
