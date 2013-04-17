namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'factory_girl_rails'
    make_users
    make_blogs
    make_posts
    make_comments
    make_subscriptions
  end
end

def make_users
  50.times do |n|
    FactoryGirl.create(:user)
  end
  admin = User.create!(
    username: "Best_User",
    email:    "best_user@example.com",
    password: "besttest",
    password_confirmation: "besttest",
    role: "admin")
end

def make_blogs
  users = User.all
  users.each { |user| FactoryGirl.create(:blog, user: user) }
end

def make_posts
  users = User.all
  users.each { |user| FactoryGirl.create(:post, user: user, blog: user.blogs.first) }
end

def make_comments
  users = User.all
  users.each { |user| FactoryGirl.create(:comment, user: user, blog: user.blogs.first, post: user.posts.first) }
end

def make_subscriptions
  users = User.all
  blogs = Blog.all
  subscribers = users[1..49]
  subscribed_blogs = blogs[2..50]
  subscriptions = subscribers.zip(subscribed_blogs)
  subscriptions.each { |user, blog| user.subscribe!(blog) }
end
