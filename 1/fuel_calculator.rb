class FuelCalculator
  def self.from_file(path)
    from_data(File.read(path).split.map(&:to_i))
  end

  def self.from_data(data)
    data.sum { |mass| calculate(mass) }
  end

  def self.calculate(mass)
    fuel = calculate_naively(mass)
    fuel.zero? ? fuel : fuel + calculate(fuel)
  end

  def self.calculate_naively(mass)
    fuel = mass / 3 - 2
    fuel.negative? ? 0 : fuel
  end
end
