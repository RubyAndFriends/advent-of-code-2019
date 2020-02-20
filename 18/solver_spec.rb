require_relative "solver"

describe Maze do
  describe "#width" do
    context "for basic_example_1" do
      it "returns 5" do
        maze = Maze.new(File.read("fixtures/basic_example_1"))
        expect(maze.width).to eq(5)
      end
    end
  end

  describe "#starting_position" do
    context "for basic_example_1" do
      it "returns [1,1]" do
        maze = Maze.new(File.read("fixtures/basic_example_1"))
        expect(maze.starting_position).to eq([1,1])
      end
    end

    context "for basic_example_2" do
      it "returns [2,1]" do
        maze = Maze.new(File.read("fixtures/basic_example_2"))
        expect(maze.starting_position).to eq([2,1])
      end
    end
  end
end

describe "#number_of_keys" do
  context "for basic_example_2" do
    it "returns 2" do
      maze = Maze.new(File.read("fixtures/basic_example_2"))
      expect(maze.keys.size).to eq(2)
    end
  end
end

describe "#peek" do
  context "for basic_example_1" do
    it "given [1,1] it should return [[2,1]]" do
      maze = Maze.new(File.read("fixtures/basic_example_1"))
      expect(maze.peek([1,1])).to eq([[2,1]])
    end
  end
end

describe Solver do
  describe ".solve_file" do
    context "for basic_example_1" do
      it "returns 2" do
        expect(Solver.solve_file("fixtures/basic_example_1")).to eq(2)
      end
    end

    context "for basic_example_2" do
      it "returns 4" do
        expect(Solver.solve_file("fixtures/basic_example_2")).to eq(4)
      end
    end

    context "for basic_example_3" do
      it "returns 3" do
        pending
        expect(Solver.solve_file("fixtures/basic_example_3")).to eq(3)
      end
    end

    context "for example_1" do
      it "returns 8" do
        pending
        expect(Solver.solve_file("fixtures/example_1")).to eq(8)
      end
    end

    context "for example_2" do
      it "returns 86" do
        pending
        expect(Solver.solve_file("fixtures/example_2")).to eq(86)
      end
    end

    context "for example_3" do
      it "returns 132" do
        pending
        expect(Solver.solve_file("fixtures/example_3")).to eq(132)
      end
    end

    context "for example_4" do
      it "returns 136" do
        pending
        expect(Solver.solve_file("fixtures/example_4")).to eq(136)
      end
    end

    context "for example_5" do
      it "returns 81" do
        pending
        expect(Solver.solve_file("fixtures/example_5")).to eq(81)
      end
    end
  end
end
