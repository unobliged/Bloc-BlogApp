class BlogsController < ApplicationController
  load_and_authorize_resource
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id]) 
  end

  def new
    @blog = current_user.blogs.new
  end 

  def create
    @blog = current_user.blogs.new(params[:blog])
    if @blog.save
      redirect_to current_user, notice: "Blog successfully created."
    else
      render 'new'
    end
  end

  def edit
    @blog = current_user.blogs.find(params[:id])
  end

  def update
    @blog = current_user.blogs.find(params[:id])
    if @blog.update_attributes(params[:blog])
      redirect_to current_user, notice: "Blog successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy 
    redirect_to blogs_path, notice: "Blog successfully destroyed."
  end
end
