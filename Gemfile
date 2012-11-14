source 'https://rubygems.org'

gem 'bundler_local_development', :group => :development, :require => false
begin
  require 'bundler_local_development'
  Bundler.development_gems = ['fat_free_crm', /^ffcrm_/]
rescue LoadError
end

gem 'fat_free_crm', :github => 'fatfreecrm/fat_free_crm'

# Needs to be explicitly added to work with bundler_local_development
gem 'rails3-jquery-autocomplete'

# Uncomment the database that you have configured in config/database.yml
# ----------------------------------------------------------------------
# gem 'mysql2', '0.3.10'
# gem 'sqlite3'
gem 'pg', '~> 0.13.2'

group :heroku do
  gem 'unicorn', :platform => :ruby
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platform => :ruby  # C Ruby (MRI) or Rubinius, but NOT Windows
  gem 'uglifier',     '>= 1.0.3'
end

gem 'turbo-sprockets-rails3'

group :development, :test do
  gem 'ruby-debug',   :platform => :mri_18
  gem 'debugger',   :platform => :mri_19
end
