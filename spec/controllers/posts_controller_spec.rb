require 'spec_helper'

describe PostsController do
  before :each do
    @user = FactoryGirl.create(:user, role: "admin")
    sign_in @user
    @blog = FactoryGirl.create(:blog, user: @user)
    @post = FactoryGirl.create(:post, blog: @blog, user: @user)
  end
  
  it "should work" do
    get :index
    assigns(:posts).should eq([@post])
    response.should render_template :index

    get :show, id: @post
    assigns(:post).should eq(@post)
    response.should render_template :show

    get :new, blog_id: @blog
    response.should render_template :new
    
    get :edit, id: @post
    response.should render_template :edit

    expect{
      post :create, blog_id: @blog
    }.to change(Post, :count).by(1)
    response.should redirect_to @post.blog

    put :update, id: @post, post: {content: "spec"}
    @post.reload
    @post.content.should eq("spec")

    expect{
      delete :destroy, id: @post 
    }.to change(Post, :count).by(-1)
    response.should redirect_to @post.blog
  end
end
