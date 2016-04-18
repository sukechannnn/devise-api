source 'https://rubygems.org'

gem 'rails', '4.2.6'

#--- DB
gem 'mysql2' # MySQL library

#--- view
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'slim-rails'           # Slim templates generator

#--- JavaScript
gem 'uglifier', '>= 1.3.0'     # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .coffee assets and views
gem 'therubyracer'             # See https://github.com/rails/execjs#readme for more supported runtimes
gem 'jquery-rails'             # Use jquery as the JavaScript library
gem 'turbolinks'               # Turbolinks makes following links in your web application faster
gem 'jbuilder', '~> 2.0'       # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

#--- Json
gem 'jwt'  # JSON Web Token
gem 'prmd' # JSON Schema tools and doc generation for HTTP APIs

#--- ユーザ認証
gem 'devise'
gem 'devise-async'
gem 'devise-encryptable' # deviseの暗号化処理を変更

#--- 設定関係
gem 'config'       # 環境ごとに定数を管理
gem 'dotenv-rails' # 環境変数管理

#--- aws
gem 'aws-sdk', '~> 2'

#--- ドキュメント
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test, :staging do
  #--- pry
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-remote'
end

group :development, :test do
  #--- rspec
  gem 'rspec-rails'           # RSpecラッパー
  gem 'factory_girl_rails'    # テストデータの生成
  gem 'spring-commands-rspec' # RspecなどでRailsをプリロード
  gem 'shoulda-matchers'      # RSpecで使えるActiveRecordのマッチャー集
  gem 'database_rewinder'     # テストで使うDBのテストデータを削除する
  gem 'simplecov'             # テストカバレッジ表示

  gem 'rubocop', require: false # コードの自動チェック
end

group :development do
  gem 'quiet_assets' # アセットログの抑制
end

#--- TODO: stg/pro環境設定時に合わせて対応
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Unicorn as the app server
# gem 'unicorn'
