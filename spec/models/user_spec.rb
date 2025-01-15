require 'rails_helper'

RSpec.describe User, type: :model do
  it "should create a User" do
    User.create(name: "Jonh Doe")
    expect(User.count).to equal(1)
  end

  it "should not create a User without name" do
    User.create
    expect(User.count).to equal(0)
  end
end