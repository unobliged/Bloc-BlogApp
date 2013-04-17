FactoryGirl.define do
  factory :comment do
    content "First Post!"
    blog
    post
    user
  end
end
