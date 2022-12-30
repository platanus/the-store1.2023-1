FactoryBot.define do
  factory :delivery_company do
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
