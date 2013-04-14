class Subscription < ActiveRecord::Base
  attr_accessible :blog_id, :user_id
  
  belongs_to :user
  belongs_to :blog
end
