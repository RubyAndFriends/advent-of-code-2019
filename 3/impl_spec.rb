require_relative "impl"

describe Impl do
  it "runs example 1" do
    expect(Impl.run("R8,U5,L5,D3", "U7,R6,D4,L4")).to eq 6
  end

  # it "runs example 2" do
  #   expect(Impl.run("R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83")).to eq 159
  # end

  it "finds positions" do
    expect(Impl.positions("U1,L2,D3,R4")).to eq [
      [0, 0],
      [0, 1],
      [-1, 1],
      [-2, 1],
      [-2, 0],
      [-2, -1],
      [-2, -2],
      [-1, -2],
      [0, -2],
      [1, -2],
      [2, -2],
    ]
  end
end
