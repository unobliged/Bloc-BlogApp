# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  content          :text
#  user_id          :integer
#  blog_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  comments_allowed :boolean          default(TRUE)
#

require 'spec_helper'

describe Post do
  before :each do
    @post = FactoryGirl.build(:post)
  end

  it "should have comments enabled by default" do
    @post.comments_allowed.should be_true
  end
end
