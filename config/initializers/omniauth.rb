OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
           scope: 'public_profile', info_fields: 'id,name,link',
           :provider_ignores_state => true

end

OAuth2::Response.register_parser(:text, 'text/plain') do |body|
  token_key, token_value, expiration_key, expiration_value = body.split(/[=&]/)
  {token_key => token_value, expiration_key => expiration_value}
end
