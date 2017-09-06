FactoryGirl.define do
  factory :book do
    title     { Faker::Book.title }
    author    { Faker::Book.author }
    publisher { Faker::Book.publisher }
    genre     { Faker::Book.genre }
    year      { Faker::Date.between(100.years.ago, Time.zone.today).year }
    image     { "#{title}.jpg" }
  end
end