module ControllerSpecHelper
  
  def token_generator(user)
    JsonWebToken.encode(user)
  end

  def expired_token_generator(user)
    JsonWebToken.encode(user, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.for_jwt),
      'Content-Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end

end