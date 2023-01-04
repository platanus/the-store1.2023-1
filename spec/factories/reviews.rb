FactoryBot.define do
  factory :review do
    user { association :user }
    item { association :item }
    body { Faker::Lorem.words }
  end
end
