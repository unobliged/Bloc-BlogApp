class StaticPagesController < ApplicationController
  def home
    @posts = Post.recent
  end

  def about
  end

  def contact
  end
end
