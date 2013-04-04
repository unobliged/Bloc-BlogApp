require 'spec_helper'

describe ViController do

  describe "GET 'app/views/devise/sessions/new.html.erb'" do
    it "returns http success" do
      get 'app/views/devise/sessions/new.html.erb'
      response.should be_success
    end
  end

end
