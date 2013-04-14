class SubscriptionsController < ApplicationController
  load_and_authorize_resource

  def create
    @blog = Blog.find(params[:blog_id])
    current_user.subscribe!(@blog)
    redirect_to @blog
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    current_user.unsubscribe!(@blog)
    redirect_to @blog
  end
end
