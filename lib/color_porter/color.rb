module ColorPorter
  class Color
    attr_accessor :red, :green, :blue

    def initialize(red, green, blue)
      @red, @green, @blue = red.to_i, green.to_i, blue.to_i
      @red = 0 unless (0..255).include?(@red)
      @green = 0 unless (0..255).include?(@green)
      @blue = 0 unless (0..255).include?(@blue)
    end

    def id
      to_hex.hex
    end

    def luma
      ((0.2126 * red) + (0.7152 * green) + (0.0722 * blue)).round
    end
    alias :luminosity :luma

    def to_s
      "rgb(#{@red},#{@green},#{@blue})"
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

      r + g + b
    end
  end
end
