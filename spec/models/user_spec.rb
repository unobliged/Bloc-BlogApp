require 'spec_helper'

describe User do
  it "should not allow duplicate usernames" do
    @user = FactoryGirl.create(:user, username: "test")
    FactoryGirl.build(:user, username: "test").should_not be_valid
  end

  it "has a default avatar" do
    test_user = FactoryGirl.build(:user)
    test_user.should respond_to :avatar
  end  
end
