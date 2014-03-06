require "spec_helper"

describe ColorPorter do

  describe "parse" do
    it "should be able to parse out hex values" do
      ColorPorter.parse('#cdcdcd').class.should == ColorPorter::Color
      ColorPorter.parse('#cdcdcd').to_hex.should == 'cdcdcd'

      ColorPorter.parse('cccccc').class.should == ColorPorter::Color
      ColorPorter.parse('cccccc').to_hex.should == 'cccccc'

      ColorPorter.parse('ccc').class.should == ColorPorter::Color
      ColorPorter.parse('ccc').to_hex.should == 'cccccc'
    end

    it "should be able to parse out rgb values" do
      ColorPorter.parse("rgb(5,5,5)").class.should == ColorPorter::Color
      ColorPorter.parse("rgb(5,5,5)").to_s.should == "rgb(5,5,5)"

      ColorPorter.parse("rgb(55,55,55)").class.should == ColorPorter::Color
      ColorPorter.parse("rgb(55,55,55)").to_s.should == "rgb(55,55,55)"

      ColorPorter.parse("rgb(120,121,123)").class.should == ColorPorter::Color
      ColorPorter.parse("rgb(120,121,123)").to_s.should == "rgb(120,121,123)"
    end

    it "should be able to parse out color names" do
      ColorPorter.parse("red").class.should == ColorPorter::Color
      ColorPorter.parse("red").to_s.should == "rgb(255,0,0)"

      ColorPorter.parse("Green").class.should == ColorPorter::Color
      ColorPorter.parse("Green").to_s.should == "rgb(0,128,0)"

      ColorPorter.parse("BLUE").class.should == ColorPorter::Color
      ColorPorter.parse("BLUE").to_s.should == "rgb(0,0,255)"
    end

    it "should return nil if no match is found" do
      ColorPorter.parse("#internet").should == nil
    end
  end

  describe ColorPorter::Color do
    describe "initialize" do
      it "it should initialize with a valid rgb value" do
        ColorPorter::Color.new(100,100,100).to_s.should == "rgb(100,100,100)"
      end
    end

    describe "luma" do
      it "should return the luma" do
        ColorPorter::Color.new(255,255,255).luma.should == 255
        ColorPorter::Color.new(0,0,0).luminosity.should == 0
      end
    end

    describe "to_s" do
      it "should return a string rgb" do
        ColorPorter::Color.new(120,120,121).to_s.should == "rgb(120,120,121)"
      end
    end

    describe "to_hex" do
      it "should return a hex value" do
        ColorPorter::Color.new(120,120,121).to_hex.should == "787879"
      end
    end
  end

end
