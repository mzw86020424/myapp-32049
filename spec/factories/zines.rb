FactoryBot.define do
  factory :zine do
    year           {Faker::Number.between(from: 2019, to: 2020)}
    month          {Faker::Number.between(from: 1, to: 12)}
    association :user
  end
end