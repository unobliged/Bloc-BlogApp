# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :string(255)
#  blog_id    :string(255)
#  post_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :blog_id, :content, :post_id, :user_id
	
	belongs_to :user
	belongs_to :post
	belongs_to :blog
end
