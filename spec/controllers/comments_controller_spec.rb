require 'spec_helper'

describe CommentsController do
  before :each do
    @user = FactoryGirl.create(:user, role: "admin")
    sign_in @user
  end
  
  describe "routes" do

    it "should work" do
      @blog = FactoryGirl.create(:blog, user: @user)
      @post = FactoryGirl.create(:post, blog: @blog, user: @user)
      @comment = FactoryGirl.create(:comment, post: @post, blog: @blog, user: @user)
  
      get :index
      assigns(:comments).should eq([@comment])
      response.should render_template :index
  
      get :show, id: @comment
      assigns(:comment).should eq(@comment)
      response.should render_template :show
  
      get :new, post_id: @post
      response.should render_template :new
      
      get :edit, id: @comment
      response.should render_template :edit
  
      expect{
        post :create, post_id: @post
      }.to change(Comment, :count).by(1)
      response.should redirect_to @comment.post
  
      put :update, id: @comment, comment: {content: "spec"}
      @comment.reload
      @comment.content.should eq("spec")

      expect{
        delete :destroy, id: @comment
      }.to change(Comment, :count).by(-1)
      response.should redirect_to @comment.post
    end
  end
end
