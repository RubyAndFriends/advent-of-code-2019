require_relative "fuel_calculator"

describe FuelCalculator do
  it "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2" do
    expect(described_class.calculate(12)).to eq 2
  end
end
