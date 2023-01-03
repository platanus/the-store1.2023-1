FactoryBot.define do
  factory :purchase do
    user
    item
  end

  trait :with_delivery_company do
    delivery_date { Time.zone.today }
    delivery_company { create(:delivery_company) }
  end

  trait :delivered do
    status { :delivered }
  end
end
