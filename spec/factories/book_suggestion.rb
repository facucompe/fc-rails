FactoryGirl.define do
  factory :book_suggestion do
    author    { Faker::Book.author }
    title     { Faker::Book.title }
    publisher { Faker::Book.publisher }
    price     { Faker::Commerce.price }
    year      { Faker::Date.between(100.years.ago, Time.zone.today).year }
    editorial { publisher }
    link      { 'https://wbooks/' + title.delete(' ') }
  end
end
