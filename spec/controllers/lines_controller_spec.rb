require 'rails_helper'

RSpec.describe V1::LinesController, :type => :controller do

  describe "GET #show" do
    before(:each) do
      FactoryGirl.create(:line)
    end

    it "valid request responds successfully with an HTTP 200 status code" do
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
    end

    it "invalid request responds with HTTP 413 status code" do
      get :show, { line: 0 }
      expect(response).to have_http_status(413)
      json = JSON.parse(response.body)
      expect(json["message"]).to eq("Requested line doesn't exist or is beyond the end of the file.")
    end
  end
end