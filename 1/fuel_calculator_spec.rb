require_relative "fuel_calculator"

describe FuelCalculator do
  it "For a mass of 2, the fuel required is 0 (aka wishing hard)" do
    expect(described_class.calculate(2)).to eq 0
  end

  it "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2" do
    expect(described_class.calculate(12)).to eq 2
  end

  it "For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2" do
    expect(described_class.calculate(14)).to eq 2
  end

  # it "For a mass of 1969, the fuel required is 654" do
  #   expect(described_class.calculate(1969)).to eq 654
  # end

  it "For a mass of 1969, the fuel required is 966" do
    expect(described_class.calculate(1969)).to eq 654 + 216 + 70 + 21 + 5
  end

  xit "calculates the fuel needed for the masses in a file, v2" do
    expect(described_class.from_file("input.txt")).to eq 12345
  end

  xit "calculates the fuel needed for the masses in an array, v2" do
    expect(described_class.from_data([1969, 12])).to eq (654 + 216 + 70 + 21 + 5) + 2
  end
end
