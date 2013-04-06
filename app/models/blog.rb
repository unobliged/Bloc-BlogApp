# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Blog < ActiveRecord::Base
  attr_accessible :title

  has_many :posts
  has_many :comments
  belongs_to :user
end
