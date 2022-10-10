source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Gem for Object Storage Yandex Cloud
gem "aws-sdk-s3"
# Bundle and process CSS with Bootstrap
gem "cssbundling-rails"
# Authentication for Rails with Warden
gem "devise"
# Translations for devise gem
gem "devise-i18n"
# High-level wrapper for processing images for the web with ImageMagick
gem "image_processing"
# Bundle and transpile JavaScript in Rails with Webpack.
gem "jsbundling-rails"
# Ruby wrapper for Mailjet's v3 API
gem "mailjet"
# Gems generalized Rack framework for multiple-provider authentication.
gem "omniauth", "~> 1.5"
gem "omniauth-oauth2", "~> 1.6.0"
gem "omniauth-github", "~> 1.4.0"
gem "omniauth-vkontakte", "~> 1.6.0"
gem "omniauth-rails_csrf_protection", "~> 0.1.2"
# HTTP 1.1 server for Ruby/Rack applications
gem "puma", "~> 5.0"
# Object oriented authorization for Rails applications
gem "pundit"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
# A set of common locale data and translations to internationalize and/or localize Rails applications.
gem "rails-i18n", "~> 7.0", ">= 7.0.5"
# Redis-backed Ruby library for creating background jobs
gem "resque"
# Helpers for the reCAPTCHA API
gem "recaptcha", "~> 3.3", require: "recaptcha/rails"
# Sprockets Rails integration
gem "sprockets-rails"
# A modest JavaScript framework for the HTML
gem "stimulus-rails"
# Speed of a single-page web application without having to write any JavaScript
gem "turbo-rails"

group :development, :test do
  # debugger
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # SQLite3 database engine
  gem "sqlite3", "~> 1.4"
  # Testing framework for Rails 5+
  gem "rspec-rails"
  # RSpec- and Minitest-compatible one-liners to test common Rails functionality
  gem "shoulda-matchers"
end

group :development do
  # Utility and framework for executing commands in parallel on multiple remote machines, via SSH
  gem "capistrano"
  gem "capistrano-rails"
  gem "capistrano-passenger"
  gem "capistrano-rbenv"
  gem "capistrano-bundler"
  gem "capistrano-resque", require: false

  # A Ruby binding to the Ed25519 elliptic curve public-key signature system described in RFC 8032
  gem "ed25519", ">= 1.2", "< 2.0"
  # Implements bcrypt_pbkdf (a variant of PBKDF2 with bcrypt-based PRF)
  gem "bcrypt_pbkdf", ">= 1.0", "< 2.0"
  # Debugging tool
  gem "web-console"
end

group :production do
  # Ruby interface to the PostgreSQL RDBMS
  gem "pg"
end
