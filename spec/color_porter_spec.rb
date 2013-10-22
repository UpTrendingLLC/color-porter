require "spec_helper"

describe ColorPorter do

  describe "parse" do
    it "should be able to parse out hex values" do
      ColorPorter.parse('#cdcdcd').class.should == ColorPorter::Hex
      ColorPorter.parse('#cdcdcd').to_s.should == '#cdcdcd'

      ColorPorter.parse('cccccc').class.should == ColorPorter::Hex
      ColorPorter.parse('cccccc').to_s.should == '#cccccc'

      ColorPorter.parse('ccc').class.should == ColorPorter::Hex
      ColorPorter.parse('ccc').to_s.should == '#cccccc'
    end

    it "should be able to parse out rgb values" do
      ColorPorter.parse("rgb(5,5,5)").class.should == ColorPorter::RGB
      ColorPorter.parse("rgb(5,5,5)").to_s.should == "rgb(5,5,5)"

      ColorPorter.parse("rgb(55,55,55)").class.should == ColorPorter::RGB
      ColorPorter.parse("rgb(55,55,55)").to_s.should == "rgb(55,55,55)"

      ColorPorter.parse("rgb(120,121,123)").class.should == ColorPorter::RGB
      ColorPorter.parse("rgb(120,121,123)").to_s.should == "rgb(120,121,123)"
    end

    it "should return nil if no match is found" do
      ColorPorter.parse("#internet").should == nil
    end
  end

  describe ColorPorter::Hex do
    describe "initialize" do
      it "it should initialize with a valid hex value" do
        ColorPorter::Hex.new('ccc').to_s.should == '#cccccc'
        ColorPorter::Hex.new('cccccc').to_s.should == '#cccccc'
        ColorPorter::Hex.new('#cccccc').to_s.should == '#cccccc'
      end
    end

    describe "valid?" do
      it "should return true/false if valid" do
        ColorPorter::Hex.new('#cccccc').valid?.should == true
        ColorPorter::Hex.new('not valid').valid?.should == false
      end
    end

    describe "luminosity" do
      it "should return the value for luminosity" do
        ColorPorter::Hex.new('#cccccc').luminosity.should == 13421772
      end
    end

    describe "to_s" do
      it "should return a string value" do
        ColorPorter::Hex.new('#cccccc').to_s.should == '#cccccc'
      end
    end

    describe "to_rgb" do
      it "should convert to an RGB value" do
        rgb = ColorPorter::Hex.new('#cccccc').to_rgb
        rgb.class.should == ColorPorter::RGB
        rgb.to_s.should == "rgb(204,204,204)"
      end
    end
  end


  describe ColorPorter::RGB do
    describe "initialize" do
      it "it should initialize with a valid rgb value" do
        ColorPorter::RGB.new(100,100,100).to_s.should == "rgb(100,100,100)"
      end
    end

    describe "valid?" do
      it "should parse a hex string" do
        ColorPorter::RGB.new(120,120,121).valid?.should == true
      end
    end

    describe "luminosity" do
      it "should return the luminosity" do
        ColorPorter::RGB.new(120,120,121).luminosity.should == 7895161
      end
    end

    describe "to_s" do
      it "should return a string rgb" do
        ColorPorter::RGB.new(120,120,121).to_s.should == "rgb(120,120,121)"
      end
    end

    describe "to_hex" do
      it "should return a hex value" do
        ColorPorter::RGB.new(120,120,121).to_hex.class.should == ColorPorter::Hex
        ColorPorter::RGB.new(120,120,121).to_hex.to_s.should == "#787879"
      end
    end
  end
  
end