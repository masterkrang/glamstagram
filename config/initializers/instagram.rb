require "instagram"

Instagram.configure do |config|
  config.client_id = "dc46a995086945599c31024df4f0a094"
  config.client_secret = "6f601b286ad2407fb0aeb9b195a86ad0"
end

CALLBACK_URL = "http://0.0.0.0:3000/session/callback"