FactoryGirl.define do
  factory :blog do
    sequence(:title) {|n| "Test_Blog#{n}" }
    user
  end
end
