# Capistrano (v2.8.0 and above) includes a recipe to handle Precompiling Assets in deployment.
load 'deploy/assets'

set :user, "toliveis"  # The server's user for deploys
set :domain, 'toliveistofly.com'
set :application, "bt_app"
set :repository,  "git@github.com:polarbeardesign/bt_app.git"


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :scm, 'git'
set :branch, "master"
#set :branch, "development"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache  #In most cases you want to use this option, otherwise each deploy will do a full repository clone every time.
set :ssh_options, { :forward_agent => true }
set :deploy_to, "/home/#{user}/bt_app"
set :scm_verbose, true
set :use_sudo, false

# to overcome the "stdin: is not a tty\n" error
default_run_options[:pty] = true

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"



# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup" #, "deploy:symlink_env_file"
after "deploy:restart", "deploy:cleanup"


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do

   task :start do ; end
   task :stop do ; end

   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

  desc "symlink the db file"
  task :symlink_db_file do
    run "ln -s /home/#{user}/#{application}/shared/database.yml #{latest_release}/config/database.yml"
  end

# before "deploy:assets:precompile", "deploy:symlink_db_file", "deploy:symlink_pdf_directory"
before "deploy:assets:precompile", "deploy:symlink_db_file"

  desc "symlink my env file"
  task :symlink_env_file do
    run "ln -s /home/#{user}/#{application}/shared/production.rb /home/#{user}/#{application}/current/config/environments/production.rb"
  end


end

# causes bundle install to run
 require "bundler/capistrano"
 set :bundle_flags,    "--deployment --quiet"
