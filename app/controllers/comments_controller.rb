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

  def new_comment_form
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.js
    end   
  end 

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.blog_id = @post.blog_id
    @comment.user_id = current_or_guest_user.id
    @comment.save
  end

  def edit
    @comment = current_or_guest_user.comments.find(params[:id])
  end

  def edit_comment_form
    @comment = Comment.find(params[:comment_id]) 
    respond_to do |format|
      format.js
    end   
  end 

  def update
    @comment = current_or_guest_user.comments.find(params[:id])
    @post = @comment.post
    @comment.update_attributes(params[:comment])
  end

  def destroy
    if current_or_guest_user.role == "mod" || current_or_guest_user.role == "admin"
      @comment = Comment.find(params[:id])
    else
      @comment = current_or_guest_user.comments.find(params[:id])
    end
    @post = @comment.post
    @comment.destroy  
    #redirect_to @comment.post, notice: "Comment successfully destroyed."
  end
end
