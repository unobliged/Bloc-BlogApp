class CommentsController < ApplicationController
  def index
		@comments = Comment.all
  end

  def show
		@comment = Comment.find(params[:id]) 
  end

	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
	end	

  def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment])
		@comment.user_id = @post.user_id
		@comment.blog_id = @post.blog_id
		if @comment.save
			redirect_to @comment.post, notice: "Comment successfully created."
		else
			render 'new'
		end
  end

  def edit
		@comment = Comment.find(params[:id])
  end

  def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(params[:comment])
			redirect_to @comment, notice: "Comment successfully updated."
		else
			render 'edit'
		end
  end

  def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy	
		redirect_to @comment.post, notice: "Comment successfully destroyed."
  end
end
