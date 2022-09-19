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
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "rails-i18n", "~> 7.0", ">= 7.0.5"
gem "recaptcha", "~> 3.3", require: "recaptcha/rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "web-console"
end

group :production do
  gem "pg"
end
