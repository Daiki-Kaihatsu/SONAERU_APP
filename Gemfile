source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

# ログイン機能
gem 'devise'

# 日本語化
gem 'rails-i18n', '~> 5.1'
gem 'devise-i18n'

# bootstrap
gem 'bootstrap','~> 4.3.1'
gem 'jquery-rails'

# フォントawesome
gem 'font-awesome-rails'

#画像
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

# ページネーション 
gem 'kaminari'

# 動的フォーム
gem 'cocoon'

# 楽天API
gem 'rakuten_web_service'

# グラフ機能
gem "chartkick"
gem 'chart-js-rails', '~> 0.1.4'

# データをrails側から渡すためgonを追加
gem 'gon', '~> 6.2.0'

# バッチ処理
gem 'whenever', require: false

# capybaraでブラウザの確認
gem 'launchy'

#unicorn
gem 'unicorn'



group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # デバッグ
  gem 'pry-byebug'
  # Rspec
  gem 'rspec-rails', '~> 4.0.0'
  # Factroybot
  gem 'factory_bot_rails'
end

group :staging, :production do
  # Use Capistrano for deployment
  gem 'capistrano',                 '3.11.2'
  gem 'capistrano-rails',           '1.4.0'
  gem 'capistrano-rbenv',           '2.1.4 '
  gem 'capistrano-passenger',       '0.2.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'capistrano3-unicorn'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
end

group :production, :staging do
    gem 'unicorn'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
