require 'rails_helper'

RSpec.describe V1::LinesController, :type => :controller do

  describe "GET #show" do
    before(:each) do
      FactoryGirl.create(:line)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, { line: 1 }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    it "responds with JSON" do
      get :show, { line: 1 }
      expect(response.content_type).to eq("application/json")
    end

    it "retrieves a specific line" do
      get :show, { line: 1 }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json["line_text"]).to eq("Test line")
      expect(json["line_index"]).to eq(1)
    end
  end
end