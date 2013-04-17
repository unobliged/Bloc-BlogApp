require 'faker'

FactoryGirl.define do
  factory :post do
    sequence(:title) {|n| "Test_Post#{n}" }
    content { Faker::Lorem.paragraph }
    user
    blog
  end
end
