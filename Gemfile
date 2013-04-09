source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails',     github: 'rails/rails'
gem 'arel',      github: 'rails/arel'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'



# database
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-spork'
end

# Use edge version of sprockets-rails
gem 'sprockets-rails', github: 'rails/sprockets-rails'

# Use SCSS for stylesheets
gem 'sass-rails',   github: 'rails/sass-rails'

# To use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 1.3'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', github: 'rails/coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger', group: [:development, :test]
