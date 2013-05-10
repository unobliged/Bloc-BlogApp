class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id]) 
  end

  def new
    @blog = current_user.blogs.find(params[:blog_id])
    @post = @blog.posts.new
  end 

  def create
    @blog = current_user.blogs.find(params[:post][:blog_id])
    @post = @blog.posts.new(params[:post])
    @post.user_id = @blog.user.id
    @post.save
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: "Post successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @blog = @post.blog
    @post.destroy 
    #redirect_to @post.blog, notice: "Post successfully destroyed."
  end

  def toggle_comments
    @post = current_user.posts.find(params[:id])
    @post.toggle!(:comments_allowed)
    redirect_to (:back)
  end
end
