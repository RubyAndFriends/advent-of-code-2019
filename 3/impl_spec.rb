require_relative "impl"

describe Impl do
  it "runs example 1" do
    expect(Impl.run("R8,U5,L5,D3", "U7,R6,D4,L4")).to eq 6
  end

  it "runs example 2" do
    expect(Impl.run("R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83")).to eq 159
  end

  it "runs example 3" do
    expect(Impl.run("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")).to eq 135
  end

  it "finds positions" do
    expect(Impl.positions("U1,L2,D3,R4")).to eq [
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

  # ...........
  # .+-----+...
  # .|.....|...
  # 5|..+--X-+.
  # .|..|..|.|.
  # 3|.-X--+.|.
  # .|..|....|.
  # .|.......|.
  # .o-------+.
  # ....3..6...
  it "finds crossing positions" do
    expect(Impl.crossing("R8,U5,L5,D3", "U7,R6,D4,L4")).to contain_exactly([3,3], [6,5])
  end

  it "solves task 1" do
    w1, w2 = File.read("input.txt").split
    expect(Impl.run(w1, w2)).to eq 860
  end
end
