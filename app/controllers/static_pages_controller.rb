class StaticPagesController < ApplicationController
  def home
    @posts = Post.recent
    @blogs = Blog.trending_by_comments
  end

  def about
  end

  def contact
  end
end
