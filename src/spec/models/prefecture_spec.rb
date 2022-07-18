require 'rails_helper'

RSpec.describe Prefecture, type: :model do

  it "is valid with a name" do
    prefecture = Prefecture.new(
      name: "北海道"
    )
    expect(prefecture).to be_valid
  end

  it "is invalid without a name" do
    prefecture = Prefecture.new(
      name: ""
    )
    expect(prefecture).to be_invalid
  end

  it "is invalid with a duplicate name" do
    Prefecture.create(
      name: "青森県"
    )
    prefecture = Prefecture.new(
      name: "青森県"
    )
    prefecture.valid?
    expect(prefecture.errors[:name]).to include("has already been taken")
  end

end
