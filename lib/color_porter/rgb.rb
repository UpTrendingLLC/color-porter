module ColorPorter
  class RGB
    attr_accessor :red, :green, :blue

    def initialize(red, green, blue)
      @red, @green, @blue = red.to_i, green.to_i, blue.to_i
      @red = 0 unless (0..255).include?(@red)
      @green = 0 unless (0..255).include?(@green)
      @blue = 0 unless (0..255).include?(@blue)
    end

    def valid?
      (0..255).include?(@red) && (0..255).include?(@green) && (0..255).include?(@blue)
    end

    def luminosity
      to_hex.luminosity
    end

    def to_s
      "rgb(#{@red},#{@green},#{@blue})"
    end

    def to_rgb
      return self
    end

    def to_hex
      r, g, b = @red.to_s(16), @green.to_s(16), @blue.to_s(16)

      if r.size < 2
        r = "0" + r
      end

      if g.size < 2
        g = "0" + g
      end

      if b.size < 2
        b = "0" + b
      end

      return Hex.new("##{r}#{g}#{b}")      
    end
  end
end