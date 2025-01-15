require 'rails_helper'

RSpec.describe "Measures", type: :request do

  describe "Post measures" do
    it "should return created measure" do
      user = User.create(name: "Mary Jane")
      post user_measures_path(user), params: {
        measure: { weight: 1.80, cincture: 80 }
      }

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(response.status).to eq(201)
      expect(json).to include({ weight: 1.80, cincture: 80 })
    end

    it "should return error message measure" do
      user = User.create(name: "Mary Jane")
      post user_measures_path(user), params: {
        measure: { weight: 1.80, cincture: "75cm" }
      }

      json = JSON.parse(response.body).deep_symbolize_keys

      expect(response.status).to eq(422)
      expect(json[:errors]).to include("Cincture is not a number")
    end
  end
end