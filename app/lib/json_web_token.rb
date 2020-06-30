class JsonWebToken
  # HMAC_SECRET = Rails.application.secrets.secret_key_base
  RSA_PRIVATE_KEY = Rails.application.secrets.private_key
  RSA_PUBLIC_KEY = Rails.application.secrets.public_key

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, RSA_PRIVATE_KEY, 'RS256') # HMAC_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, RSA_PUBLIC_KEY, true, { algorithm : 'RS256'}) # HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body 
  rescue JWT::DecodeError => e 
    raise ExceptionHandler::InvalidToken, e.message
  end

end