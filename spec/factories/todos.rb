FactoryBot.define do
    factory :todo do
      title { Faker::Lorem.sentence }
    end
  end
  