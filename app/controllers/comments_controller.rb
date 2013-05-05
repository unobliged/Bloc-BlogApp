class CommentsController < ApplicationController
  load_and_authorize_resource
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
    @comment.blog_id = @post.blog_id
    @comment.user_id = current_or_guest_user.id
    if @comment.save
      redirect_to @comment.post, notice: "Comment successfully created."
    else
      render 'new'
    end
  end

  def edit
    @comment = current_or_guest_user.comments.find(params[:id])
  end

  def update
    @comment = current_or_guest_user.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, notice: "Comment successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    if current_or_guest_user.role == "mod" || current_or_guest_user.role == "admin"
      @comment = Comment.find(params[:id])
    else
      @comment = current_or_guest_user.comments.find(params[:id])
    end
    @comment.destroy  
    redirect_to @comment.post, notice: "Comment successfully destroyed."
  end
end
