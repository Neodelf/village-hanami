# encoding: utf-8
# config valid only for Capistrano 3
lock '3.4.0'

# Project configuration options
# ------------------------------

set :application,    'village'
set :login,          'neodelf'
set :user,           'hosting_neodelf'

set :deploy_to,      "/home/#{fetch(:user)}/projects/#{fetch(:application)}"
set :unicorn_conf,   "/etc/unicorn/#{fetch(:application)}.#{fetch(:login)}.rb"
set :unicorn_config_path,   "/etc/unicorn/#{fetch(:application)}.#{fetch(:login)}.rb"
set :unicorn_pid,    "/var/run/unicorn/#{fetch(:user)}/" \
                     "#{fetch(:application)}.#{fetch(:login)}.pid"
set :bundle_without, %w{development test}.join(' ')             # this is default
set :use_sudo,       false
set :unicorn_rack_env, 'production'

set :repo_url, 'git@github.com:Neodelf/village.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :scm, :git
set :format, :pretty
set :pty, true

# Change the verbosity level
set :log_level, :info

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_files, %w{.env}
set :linked_dirs, %w{tmp/pids public/assets}

# Default value for keep_releases is 5
# set :keep_releases, 5

# Configure RVM
set :rvm_ruby_version, '2.1.5'

# You unlikely have to change below this line
# -----------------------------------------------------------------------------

# Configure RVM
set :rake,            "rvm use #{fetch(:rvm_ruby_version)} do bundle exec rake"
set :bundle_cmd,      "rvm use #{fetch(:rvm_ruby_version)} do bundle"

# - for unicorn - #
namespace :deploy do

  task :symlink_uploads do
    on roles(:app), in: :sequence, wait: 5 do
      execute "ln -nfs #{shared_path}/uploads/  #{release_path}/public/"
    end
  end

  task :precompile do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && #{fetch(:bundle_cmd)} exec hanami assets precompile"
    end
  end

  task :db_migrate do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && HANAMI_ENV=production #{fetch(:bundle_cmd)} exec hanami db migrate"
    end
  end

  task :create_unicorn_stderr do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && mkdir log/ && touch log/unicorn_stderr.log"
    end
  end

  after :updating, :symlink_uploads
  after :publishing, :db_migrate
  after :publishing, :precompile
  after :publishing, :create_unicorn_stderr
  after :publishing, 'unicorn:restart'
end
