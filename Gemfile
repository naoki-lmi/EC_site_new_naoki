source 'https://rubygems.org'

ruby '2.4.4'

gem 'rails',        '5.2.2'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bcrypt',       '3.1.12'
gem 'bootstrap-sass', '3.3.7'
gem 'puma',         '3.12.4'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'capybara'
gem 'webdrivers'

gem 'mysql2',       '0.5.2'
gem 'rb-readline'
gem 'pry-rails'
gem 'device'
gem 'byebug'


gem 'enumerize'
gem 'activerecord-import'

group :development, :test do
    gem 'rspec', '~> 3.6'
    gem 'rspec-rails', '~> 3.6'
    gem 'simplecov'
    gem "factory_bot_rails"
    gem 'database_cleaner' #database_cleanerはFactoryBotでDB登録したデータをテスト終了後にクリアするために使う
    gem 'guard-rspec', require: false

    gem 'faker',          '1.7.3'

end

group :development do
  
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'

  # A browser automation framework and ecosystem
  gem 'selenium-webdriver'

  # Keep your Selenium WebDrivers updated automatically
  gem 'webdrivers'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing' # If you are using Rails 5.x
end





# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]