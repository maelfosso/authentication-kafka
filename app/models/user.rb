class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :password_digest, type: String
end

class Business < User
  
end

class Customer < User

end

class Runner < Customer

end
