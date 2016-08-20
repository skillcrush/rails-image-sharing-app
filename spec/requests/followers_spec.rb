require 'rails_helper'

RSpec.describe "Followers", type: :request do
  describe "GET /followers" do
    it "works! (now write some real specs)" do
      get followers_path
      expect(response).to have_http_status(200)
    end
  end
end
