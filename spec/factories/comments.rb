# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content "MyText"
    user_id "MyString"
    blog_id "MyString"
    post_id "MyString"
  end
end
