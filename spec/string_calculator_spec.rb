require 'spec_helper'
require './lib/string_calculator'

describe StringCalculator, "#add" do

  before :each do
    @calculator = StringCalculator.new
  end

  context "empty string" do
    it "return 0" do 
      expect(@calculator.add("")).to eq 0
    end
  end

  describe "single number" do

    context "1" do
      it "returns 1" do
        expect(@calculator.add("1")).to eq 1
      end
    end

    context "50" do
      it "returns 50" do
        expect(@calculator.add("50")).to eq 50
      end
    end

  end

  describe "comma separeted two numbers" do
    context "1,2" do
      it "returns 3" do
        expect(@calculator.add("1,2")).to eq 3
      end
    end

    context "10,20" do
      it "returns 30" do
        expect(@calculator.add("10,20")).to eq 30
      end
    end
  end

  describe "comma separeted multiple numbers" do
    context "1,2,3" do
      it "returns 6" do
        expect(@calculator.add("1,2,3")).to eq 6
      end
    end

    context "10,20,50" do
      it "returns 80" do
        expect(@calculator.add("10,20,50")).to eq 80
      end
    end
  end

  describe "new line as delimiter" do
    context "1\\n2" do
      it "returns 3" do
        expect(@calculator.add("1\n2")).to eq 3
      end
    end
  end 

  describe "support diffrent delimiters" do
    context "//;\\n1;2" do
      it "returns 3" do
        expect(@calculator.add("//;\n1;2")).to eq 3
      end
    end

    context "//;\\n1;2;10" do
      it "returns 13" do
        expect(@calculator.add("//;\n1;2;10")).to eq 13
      end
    end

  end

  describe "negative numbers will throw exception" do
    context "-1" do 
      it "negative not allowed: -1" do
        expect { @calculator.add("-1")}.to raise_error("negative not allowed: -1")
      end
    end

    context "-1,-2" do 
      it "negative not allowed: -1, -2" do
        expect { @calculator.add("-1,-2")}.to raise_error("negative not allowed: -1,-2")
      end
    end
 
  end

end

