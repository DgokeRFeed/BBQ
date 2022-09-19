Recaptcha.configure do |config|
  config.public_key = Rails.application.credentials.dig(:recaptcha, :public_key)
  config.private_key = Rails.application.credentials.dig(:recaptcha, :secret_key)
end
