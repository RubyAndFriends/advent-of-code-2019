class FuelCalculator
  def self.from_data(data)
    data.sum { |mass| calculate(mass) }
  end

  def self.calculate(mass)
    mass / 3 - 2
  end
end
