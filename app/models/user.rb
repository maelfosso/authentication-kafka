class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :password_digest, type: String

  validates_presence_of :name, :email, :phone, :password_digest

end

class Business < User
  
end

class Customer < User

end

class Runner < Customer

end
