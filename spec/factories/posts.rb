FactoryBot.define do
  factory :post do
    url            {Faker::Internet.url}
    year           {Faker::Number.between(from: 2019, to: 2020)}
    month          {Faker::Number.between(from: 1, to: 12)}
    association :user
    association :zine
  end 
end