class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user.for_jwt) if user
  end

  private

  attr_reader :email, :password

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  rescue Mongoid::Errors::DocumentNotFound => e
    raise(ExceptionHandler::AuthenticationError, "#{Message.invalid_credentials} #{e.message}")
  end

end
