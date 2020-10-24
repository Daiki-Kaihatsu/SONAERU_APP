# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.14.1'

# Capistranoのログの表示に利用する
set :application, 'SONAERU_APP'
# set :deploy_to, '/var/www/rails/SONAERU_APP/'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:Daiki-Kaihatsu/SONAERU_APP.git'

set :rbenv_type, :user
set :rbenv_ruby, '2.7.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :log_level, :warn

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :keep_releases, 3

set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :unicorn_config_path, -> { File.join(current_path, "config", "unicorn.rb") }

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end
end

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
