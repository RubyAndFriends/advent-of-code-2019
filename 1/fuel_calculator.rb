class FuelCalculator
  def self.from_file(path)
    from_data(File.read(path).split.map(&:to_i))
  end

  def self.from_data(data)
    data.sum { |mass| calculate(mass) }
  end

  def self.calculate(mass)
    mass / 3 - 2
  end
end
