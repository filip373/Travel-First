source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18.4'
gem 'puma', '~> 3.0'
gem 'foreman'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'rubocop', '~> 0.42.0', require: false

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-jquery.scrollTo'
end

group :development, :test do
  gem 'pry', '~> 0.10.4'
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara'
end

group :test do
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'rack-livereload'
  gem 'guard-livereload', '~> 2.5', require: false
end
