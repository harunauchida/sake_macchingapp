source 'https://rubygems.org'  
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.10'

# Rails本体
gem 'rails', '~> 6.1.7', '>= 6.1.7.10'
gem 'puma', '~> 5.0'

# フロントエンド
gem 'sass-rails', '>= 6'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# 認証・画像管理
gem 'bcrypt', '~> 3.1.7'
gem 'image_processing', '~> 1.2'

# パフォーマンス・キャッシュ
gem 'bootsnap', '>= 1.4.4', require: false

# 開発・テスト共通
group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # RSpec（Rails用テストフレームワーク）
  gem 'rspec-rails', '~> 5.1'

  # FactoryBot（テストデータ生成）
  gem 'factory_bot_rails'

  
  gem 'faker'
end

# 本番環境専用
group :production do
  gem 'pg'
end

# 開発環境専用
group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
end

# テスト環境専用
group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'database_cleaner-active_record'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'concurrent-ruby', '1.3.4'
