# == Schema Information
#
# Table name: blogs
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Blog < ActiveRecord::Base
  attr_accessible :title, :logo, :comments_allowed
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/default_logo.jpg"

  has_many :posts
  has_many :comments
  belongs_to :user
  has_many :subscriptions, foreign_key: "blog_id", dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  def subscriber?(user)
    subscriptions.find_by_user_id(user.id)
  end

  scope :trending_by_subscribers, select("blogs.*, count(subscriptions.id) AS subscriptions_count").joins("left join subscriptions on subscriptions.blog_id = blogs.id").group("blogs.id").order("subscriptions_count DESC").limit(9)
  scope :trending_by_comments, select("blogs.*, count(comments.id) AS comments_count").joins("left join comments on comments.blog_id = blogs.id").group("blogs.id").order("comments_count DESC").limit(9)
end
