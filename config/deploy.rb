default_run_options[:pty] = true

set :domain, 'csserver.evansville.edu'
set :application, "friedcheckin"
set :repository,  "friedcheckin@csserver.evansville.edu:/usr/local/git/friedcheckinserver.git"
set :deploy_to, '/usr/local/friedcheckin'

set :scm, 'git'
set :branch, 'deploy'
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "csserver.evansville.edu"                          # Your HTTP server, Apache/etc
role :app, "csserver.evansville.edu"                          # This may be the same as your `Web` server
role :db,  "csserver.evansville.edu", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :seed do
    run "cd #{current_path}; rake db:see RAILS_ENV=production"
  end
end
