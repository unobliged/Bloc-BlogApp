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

describe User do
  before :each do
    @user = FactoryGirl.create(:user, username: "test")
  end

  it "should not allow duplicate usernames" do
    FactoryGirl.build(:user, username: "test").should_not be_valid
  end

  it "has a default avatar" do
    @user.should respond_to :avatar
  end  

  it "can subscrible and unsubscribe from a blog" do
    @blog = FactoryGirl.build(:blog)
    @user.subscribe!(@blog)
    @user.subscriptions.should_not be_nil
    @user.unsubscribe!(@blog)
  end
end
