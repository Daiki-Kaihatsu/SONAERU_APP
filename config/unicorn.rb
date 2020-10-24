APP_PATH   = "#{File.dirname(__FILE__)}/.." unless defined?(APP_PATH)
RAILS_ROOT = "#{File.dirname(__FILE__)}/.." unless defined?(RAILS_ROOT)
RAILS_ENV  = ENV['RAILS_ENV'] || 'development'

worker_processes 3

listen "/tmp/unicorn.sock"
pid "tmp/pids/unicorn.pid"

preload_app true

timeout 60
working_directory APP_PATH

# logのpath
stderr_path "#{RAILS_ROOT}/log/unicorn_error.log"
stdout_path "#{RAILS_ROOT}/log/unicorn_access.log"

if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = APP_PATH + "/Gemfile"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH

    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end







# # Railsのルートパスを求める。(RAILS_ROOT/config/unicorn.rbに配置している場合。)
# rails_root = File.expand_path('../../', __FILE__)

# # 追記に記載してます。入れた方がいいです。
# ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"

# # Unicornは複数のワーカーで起動するのでワーカー数を定義
# # サーバーのメモリなどによって変更すること。
# worker_processes 2

# # 指定しなくても良い。
# # Unicornの起動コマンドを実行するディレクトリを指定します。
# # （記載しておけば他のディレクトリでこのファイルを叩けなくなる。）
# working_directory rails_root

# # 接続タイムアウト時間
# timeout 30

# # Unicornのエラーログと通常ログの位置を指定。
# stderr_path File.expand_path('../../log/unicorn_stderr.log', __FILE__)
# stdout_path File.expand_path('../../log/unicorn_stdout.log', __FILE__)

# # Nginxで使用する場合は以下の設定を行う。
# listen File.expand_path('../../tmp/sockets/unicorn.sock', __FILE__)


# # プロセスの停止などに必要なPIDファイルの保存先を指定。
# pid File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)

# # 基本的には`true`を指定する。Unicornの再起動時にダウンタイムなしで再起動が行われる。
# preload_app true


# # USR2シグナルを受けると古いプロセスを止める。
# # 後述するが、記述しておくとNginxと連携する時に良いことがある。
# before_fork do |server, worker|
#   defined?(ActiveRecord::Base) and
#       ActiveRecord::Base.connection.disconnect!

#   old_pid = "#{server.config[:pid]}.oldbin"
#   if old_pid != server.pid
#     begin
#       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
#       Process.kill(sig, File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH
#     end
#   end
# end

# after_fork do |server, worker|
#   defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
# end



# # worker  = 2
# #   timeout = 30
# #   app_dir = File.expand_path("../../", __FILE__) #自分のアプリケーションまでのpath
# #   listen  = "#{app_dir}tmp/sockets/.unicorn.sock"
# #   pid  = "#{app_dir}tmp/pids/unicorn.pid"
# #   std_log  = "#{app_dir}log/unicorn.log"
# #   # set config
# #   worker_processes = worker
# #   working_directory = app_dir
# #   stderr_path = std_log
# #   stdout_path = std_log
  
# #   # loading booster
# #   preload_app true
# #   # before starting processes
# #   before_fork do |server, worker|
# #     defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
# #     old_pid = "#{server.config[:pid]}.oldbin"
# #     if old_pid != server.pid
# #       begin
# #         Process.kill "QUIT", File.read(old_pid).to_i
# #       rescue Errno::ENOENT, Errno::ESRCH
# #       end
# #     end
# #   end
# #   # after finishing processes
# #   after_fork do |server, worker|
# #     defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
# #   end