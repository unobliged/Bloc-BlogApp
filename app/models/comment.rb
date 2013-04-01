class Comment < ActiveRecord::Base
  attr_accessible :blog_id, :content, :post_id, :user_id
end
