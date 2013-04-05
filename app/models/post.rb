# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  blog_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :blog_id, :content, :title, :user_id
	
	has_many :comments
	belongs_to :user
	belongs_to :blog

	scope :recent, order('created_at desc').limit(10)
end
