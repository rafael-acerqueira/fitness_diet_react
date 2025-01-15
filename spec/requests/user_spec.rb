require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "Post users" do
    it "should return created user" do
      post users_path, params: {
        user: { name: "Jonh Doe" }
      }

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response.status).to eq(201)
      expect(json).to include({ name: "Jonh Doe" })
    end

    it "should return error message user" do
      post users_path, params: {
        user: { name: nil }
      }

      json = JSON.parse(response.body).deep_symbolize_keys

      expect(response.status).to eq(422)
      expect(json[:errors]).to include("Name can't be blank")
    end
  end
end