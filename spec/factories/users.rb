FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    phone { Faker::PhoneNumber.cell_phone }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end