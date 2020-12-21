FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}

  after(:build) do |post|
    post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end