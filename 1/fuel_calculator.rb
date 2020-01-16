class FuelCalculator
  def self.from_file(path)
    from_data(File.read(path).split.map(&:to_i))
  end

  def self.from_data(data)
    data.sum { |mass| calculate(mass) }
  end

  def self.calculate(module_mass)
    tmp = calculate_naively(module_mass)
    if tmp.zero?
      tmp
    else
      tmp + calculate(tmp)
    end
  end

  def self.calculate_naively(module_mass)
    fuel = module_mass / 3 - 2
    fuel.negative? ? 0 : fuel
  end
end
