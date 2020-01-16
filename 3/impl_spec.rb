require_relative "impl"

describe Impl do
  it "works" do
    expect(Impl.run("R8,U5,L5,D3", "U7,R6,D4,L4")).to eq 6
  end
end
