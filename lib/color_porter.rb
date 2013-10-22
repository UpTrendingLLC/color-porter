require "color_porter/version"

module ColorPorter
  CSS_RGB_REGEX = /rgb\((?<r>\d{1,3}),(?<g>\d{1,3}),(?<b>\d{1,3})\)/
  CSS_HEX_REGEX = /([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?\b/

  def self.parse(color_string)
    # Consider Implementing: parsing values that come in as red, green, blue, pink and convert to Hex value
    #                 as browsers parse them.

    if color_string =~ CSS_RGB_REGEX
      rgb_data = color_string.match(CSS_RGB_REGEX)
      RGB.new(rgb_data[:r], rgb_data[:g], rgb_data[:b])
    elsif color_string =~ CSS_HEX_REGEX
      Hex.new(color_string)
    else
      return nil
    end
  end


end