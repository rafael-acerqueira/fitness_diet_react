require 'rails_helper'

RSpec.describe Measure, type: :model do
  it "should create a Measure" do
    Measure.create(weight: 70.5, cincture: 88, user: User.create(name: "Jonh Doe"))
    expect(Measure.count).to equal(1)
  end

  it "should not create a Measure without name" do
    Measure.create
    expect(Measure.count).to equal(0)
  end
end