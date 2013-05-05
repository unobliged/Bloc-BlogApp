require 'spec_helper'

describe UsersController do
  before :each do
    @user = FactoryGirl.create(:user, role: "admin")
    sign_in @user
  end
  
  describe "routes" do

    it "should work" do
      get :index
      assigns(:users).should eq([@user])
      response.should render_template :index
  
      get :show, id: @user
      assigns(:user).should eq(@user)
      response.should render_template :show
  
      get :edit, id: @user
      response.should redirect_to(edit_user_registration_path)
  
      put :update, id: @user, user: {username: "spec"}
      @user.reload
      @user.username.should eq("spec")
    end
  end
end
