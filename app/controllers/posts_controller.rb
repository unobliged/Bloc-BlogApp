class PostsController < ApplicationController
  def index
		@posts = Post.all
  end

  def show
		@post = Post.find(params[:id]) 
  end

	def new
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.new
	end	

  def create
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts.new(params[:post])
		@post.user_id = @blog.user.id
		if @post.save
			redirect_to @post.blog, notice: "Post successfully created."
		else
			render 'new'
		end
  end

  def edit
		@post = Post.find(params[:id])
  end

  def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to @post, notice: "Post successfully updated."
		else
			render 'edit'
		end
  end

  def destroy
		@post = Post.find(params[:id])
		@post.destroy	
		redirect_to @post.blog, notice: "Post successfully destroyed."
  end
end
