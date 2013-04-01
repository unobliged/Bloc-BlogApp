class Post < ActiveRecord::Base
  attr_accessible :blog_id, :content, :title, :user_id
end
