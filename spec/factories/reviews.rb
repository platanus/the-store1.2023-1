FactoryBot.define do
  factory :review do
    user
    item
    body { Faker::Lorem.words }
  end
end
