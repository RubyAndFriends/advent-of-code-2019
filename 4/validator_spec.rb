require_relative "validator"

describe Validator do
  describe ".validate" do
    context "for 122345" do
      it "returns true" do
        pending
        expect(Validator.validate(122345)).to eq(true)
      end
    end

    context "for 111123" do
      it "returns true" do
        pending
        expect(Validator.validate(111123)).to eq(true)
      end
    end

    context "for 111111" do
      it "returns true" do
        pending
        expect(Validator.validate(111111)).to eq(true)
      end
    end

    context "for 135679" do
      it "returns false, because there are no doubles" do
        pending
        expect(Validator.validate(135679)).to eq(false)
      end
    end

    context "for 123789" do
      it "returns false, because there are no doubles" do
        pending
        expect(Validator.validate(123789)).to eq(false)
      end
    end

    context "for 223450" do
      it "returns false, because the last digit is decreasing" do
        pending
        expect(Validator.validate(223450)).to eq(false)
      end
    end

    context "for 221456" do
      it "returns false, because the third digit is decreasing" do
        pending
        expect(Validator.validate(221456)).to eq(false)
      end
    end
  end
end
