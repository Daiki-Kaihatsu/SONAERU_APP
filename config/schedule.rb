# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development

# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, error: 'log/crontab_error.log', standard: 'log/crontab.log' # ログを書き出すようにしておくとデバッグが楽
ENV.each { |k, v| env(k, v) } 

# stagingのみで実行
if rails_env.to_sym != :development
  every 1.minute do
    begin
      rake 'get_csv:csv_scraping', :environment_variable => "RAILS_ENV", :environment => "development"
      # command "docker-compose exec app bundle exec rails db:seed" 
    rescue => e
      Rails.logger.error("aborted rake task")
      raise e
    end
  end
end