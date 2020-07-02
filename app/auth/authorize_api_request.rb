class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    # Check if the user is in the database and memoize it as user object
    @user ||= User.find(decoded_auth_token[:id]) if decoded_auth_token
  # rescue ActiveRecord::RecordNotFound => e
  rescue Mongoid::Errors::DocumentNotFound => e
    raise(ExceptionHandler::InvalidToken, "#{Message.invalid_token} #{e.message}")
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
    
    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end


end