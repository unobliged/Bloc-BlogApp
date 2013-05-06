require 'spec_helper'

describe BlogsController do
  before :each do
    @user = FactoryGirl.create(:user, role: "admin")
    sign_in @user
    @blog = FactoryGirl.create(:blog, user: @user)
  end
  
  it "should work" do
    get :index
    assigns(:blogs).should eq([@blog])
    response.should render_template :index

    get :show, id: @blog
    assigns(:blog).should eq(@blog)
    response.should render_template :show

    get :new
    response.should render_template :new
    
    get :edit, id: @blog
    response.should render_template :edit

    expect{
      post:create  
    }.to change(Blog, :count).by(1)

    put :update, id: @blog, blog: {title: "spec"}
    @blog.reload
    @blog.title.should eq("spec")

    expect{
      delete :destroy, id: @blog
    }.to change(Blog, :count).by(-1)
    response.should redirect_to blogs_path
  end
end
