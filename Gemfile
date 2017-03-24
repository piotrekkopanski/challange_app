source 'https://rubygems.org'

# core
gem 'rails', '4.1.1'

gem 'devise'
gem 'cancan', '~> 1.6', '>= 1.6.10'
gem 'acts_as_votable', '~> 0.10.0'
gem 'simple_form', '~> 3.4'
gem 'best_in_place',  github: 'bernat/best_in_place'
gem 'carrierwave', '~>0.10.0'
gem 'mini_magick', '~> 4.6', '>= 4.6.1'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'

# frontend
gem 'slim-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'rake', '~> 12.0'
gem 'better_errors', '~> 2.1', '>= 2.1.1'
gem 'redcarpet', '~> 3.4'
# doc
gem 'sdoc', '~> 0.4.0',          group: :doc

# development
group :development do
 gem 'sqlite3'
  gem 'spring'
end
 
#production
group :production do
  gem 'pg'
end

# testing
group :test do
  gem "database_cleaner",   "~> 1.2.0"
  gem "capybara",           github: "jnicklas/capybara" # master until rspec3 fixes are released #~> 2.2.0"
  gem "poltergeist",        "~> 1.5.0"
  gem "factory_girl_rails", "~> 4.2.0"
  gem "cucumber-rails",     "~> 1.4.1", require: false
  gem "factory_girl"
  gem "rspec-rails"
end

