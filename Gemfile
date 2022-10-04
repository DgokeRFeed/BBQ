source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "aws-sdk-s3"
gem "cssbundling-rails"
gem "devise"
gem "devise-i18n"
gem "image_processing"
gem "jsbundling-rails"
gem "mailjet"
gem "omniauth", "~> 1.5"
gem "omniauth-oauth2", "~> 1.6.0"
gem "omniauth-github", "~> 1.4.0"
gem "omniauth-vkontakte", "~> 1.6.0"
gem "omniauth-rails_csrf_protection", "~> 0.1.2"
gem "puma", "~> 5.0"
gem "pundit"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "rails-i18n", "~> 7.0", ">= 7.0.5"
gem "resque"
gem "recaptcha", "~> 3.3", require: "recaptcha/rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
  gem "rspec-rails"
  gem "shoulda-matchers"
end

group :development do
  gem "capistrano"
  gem "capistrano-rails"
  gem "capistrano-passenger"
  gem "capistrano-rbenv"
  gem "capistrano-bundler"
  gem "capistrano-resque", require: false

  gem "ed25519", ">= 1.2", "< 2.0"
  gem "bcrypt_pbkdf", ">= 1.0", "< 2.0"
  gem "web-console"
end

group :production do
  gem "pg"
end
