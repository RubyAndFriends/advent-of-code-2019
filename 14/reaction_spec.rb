require_relative "reaction"

describe Reaction do
  describe ".solve_file" do
    context "for basic_example_1" do
      it "returns 3" do
        pending
        expect(Reaction.solve_file("fixtures/basic_example_1")).to eq(3)
      end
    end

    context "for example_1" do
      it "returns 31" do
        pending
        expect(Reaction.solve_file("fixtures/example_1")).to eq(31)
      end
    end

    context "for example_2" do
      it "returns 165" do
        pending
        expect(Reaction.solve_file("fixtures/example_2")).to eq(165)
      end
    end

    context "for example_3" do
      it "returns 13312" do
        pending
        expect(Reaction.solve_file("fixtures/example_3")).to eq(13312)
      end
    end

    context "for example_4" do
      it "returns 180697" do
        pending
        expect(Reaction.solve_file("fixtures/example_4")).to eq(180697)
      end
    end

    context "for example_5" do
      it "returns 2210736" do
        pending
        expect(Reaction.solve_file("fixtures/example_5")).to eq(2210736)
      end
    end
  end
end
