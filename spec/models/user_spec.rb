# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#  role                   :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

require 'spec_helper'
require "cancan/matchers"

describe User do
  before :each do
    @user = FactoryGirl.create(:user, username: "test", role: "admin")
  end

  it "should not allow duplicate usernames" do
    FactoryGirl.build(:user, username: "test").should_not be_valid
  end

  it "has a default avatar" do
    @user.should respond_to :avatar
  end  

  it "can subscribe and unsubscribe from a blog" do
    @blog = FactoryGirl.build(:blog)
    @user.subscribe!(@blog)
    @user.subscriptions.should_not be_nil
    @user.unsubscribe!(@blog)
  end

  it "has comment access as guest" do
    @guest = FactoryGirl.build(:user)
    @ability = Ability.new(@guest)
    @ability.should be_able_to(:manage, Comment.new)
  end

  it "can manage all as admin" do
    @ability = Ability.new(@user)
    @ability.should be_able_to(:manage, User.new)
    @ability.should be_able_to(:manage, Blog.new)
    @ability.should be_able_to(:manage, Post.new)
    @ability.should be_able_to(:manage, Comment.new)
    @ability.should be_able_to(:manage, Subscription.new)
  end
end
