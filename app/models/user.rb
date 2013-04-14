# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#

class User < ActiveRecord::Base
  validates_uniqueness_of :username
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role
  # attr_accessible :title, :body

  has_many :blogs
  has_many :posts
  has_many :comments
  has_many :subscriptions, foreign_key: "user_id", dependent: :destroy
  has_many :subscribed_blogs, through: :subscriptions, source: :blog

  def subscribed?(blog)
    subscriptions.find_by_blog_id(blog.id)
  end

  def subscribe!(blog)
    subscriptions.create!(blog_id: blog.id)
  end

  def unsubscribe!(blog)
    subscriptions.find_by_blog_id(blog.id).destroy
  end

end
