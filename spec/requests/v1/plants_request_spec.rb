require 'rails_helper'

RSpec.describe "V1::Plants", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/v1/plants/index"
      expect(response).to have_http_status(:success)
    end
  end
end
