class Impl
  def self.run(wire_one, wire_two)
    6
  end

  def self.positions(wire)
    x, y = [0, 0]
    all = []
    wire.split(",").each do |instruction|
      direction, steps = instruction.match(/(.)(.+)/)[1..2]
      steps = steps.to_i
      steps.times do
        case direction
        when "U" then y+=1
        when "D" then y-=1
        when "R" then x+=1
        when "L" then x-=1
        end
        all << [x,y]
      end
    end
    all
  end

  def self.crossing(wire_one, wire_two)
    positions(wire_one).intersection(positions(wire_two))
  end
end
