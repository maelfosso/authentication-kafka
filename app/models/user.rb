class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :password_digest, type: String

  validates_presence_of :name, :email, :phone, :password_digest

  def for_jwt
    return { id: self.id, name: self.name, email: self.email, phone: self.phone }
  end

end

class Business < User
  
end

class Customer < User

end

class Runner < Customer

end
