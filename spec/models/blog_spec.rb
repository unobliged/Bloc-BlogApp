# == Schema Information
#
# Table name: blogs
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  comments_allowed  :boolean          default(TRUE)
#

require 'spec_helper'

describe Blog do
  before :each do
    @blog = FactoryGirl.build(:blog)
  end

  it "should have comments enabled by default" do
    @blog.comments_allowed.should be_true
  end
end
