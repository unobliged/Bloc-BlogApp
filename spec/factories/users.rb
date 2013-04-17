FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "User#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password "testtest"
    password_confirmation "testtest"
    role ""
  end
end
