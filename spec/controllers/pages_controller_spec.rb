require 'spec_helper'

describe PagesController do

  describe "GET 'livechat'" do
    it "returns http success" do
      get 'livechat'
      response.should be_success
    end
  end

end
