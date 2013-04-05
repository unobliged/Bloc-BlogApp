class BlogsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
  def index
		@blogs = Blog.all
  end

  def show
		@blog = Blog.find(params[:id]) 
  end

	def new
		@blog = current_or_guest_user.blogs.new
	end	

  def create
		@blog = current_or_guest_user.blogs.new(params[:blog])
		if @blog.save
			redirect_to current_or_guest_user, notice: "Blog successfully created."
		else
			render 'new'
		end
  end

  def edit
		@blog = current_or_guest_user.blogs.find(params[:id])
  end

  def update
		@blog = current_or_guest_user.blogs.find(params[:id])
		if @blog.update_attributes(params[:blog])
			redirect_to current_or_guest_user, notice: "Blog successfully updated."
		else
			render 'edit'
		end
  end

  def destroy
		@blog = current_or_guest_user.blogs.find(params[:id])
		@blog.destroy	
		redirect_to blogs_path, notice: "Blog successfully destroyed."
  end
end
