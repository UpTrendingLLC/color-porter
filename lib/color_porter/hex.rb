module ColorPorter
  class Hex
    attr_accessor :code

    def initialize(code='')
      code = code.to_s.gsub('#', '')
      @code = (code.length == 3 ? code*2 : code).gsub!(/[\W_]*/, '')
      @code = nil unless valid?
    end

    def valid?
      @code.nil? ? false : @code.size == 6
    end

    def luminosity
      @code.hex
    end

    def to_s
      "##{@code.to_s}"
    end

    def to_hex
      return self
    end

    def to_rgb
      hex_str_rev = @code.each_char.to_a.reverse.join
      if hex_str_rev.size == 3
        hex_str_rev = hex_str_rev[0] + hex_str_rev[0] + hex_str_rev[1] + hex_str_rev[1] + hex_str_rev[2] + hex_str_rev[2]
      elsif hex_str_rev.size != 6
        return nil
      end

      hex = hex_str_rev.to_s.hex
      rgb = {}
      %w(r g b).inject(hex) {|a,i| rest, rgb[i] = a.divmod 256; rest}
      red = rgb["r"].to_s
      green = rgb["g"].to_s
      blue = rgb["b"].to_s

      RGB.new(red, green, blue)
    end
  end
end