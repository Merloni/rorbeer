require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is saved correctly if it has name and style" do
    beer = Beer.create name:"bear", style:"Lager"
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end
  it "is not saved if no name is given" do
    beer = Beer.create style:"Lager"
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
  it "is not saved if no style is given" do
    beer = Beer.create name:"ASD"
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end
