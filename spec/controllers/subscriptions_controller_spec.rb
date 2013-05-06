require 'spec_helper'

describe SubscriptionsController do
  before :each do
    @user = FactoryGirl.create(:user, role: "admin")
    sign_in @user
    @blog = FactoryGirl.create(:blog, user: @user)
  end

  it "should work" do
    expect{
      post :create, blog_id: @blog
    }.to change(Subscription, :count).by(1)

    expect{
      delete :destroy, blog_id: @blog
    }.to change(Subscription, :count).by(-1)
  end
end
