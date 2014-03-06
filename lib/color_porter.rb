require "color_porter/version"
require "color_porter/color"
require "yaml"

module ColorPorter
  module_function
  CSS_RGB_REGEX = /rgb\((?<r>\d{1,3}),(?<g>\d{1,3}),(?<b>\d{1,3})\)/
  CSS_HEX_REGEX = /#?(?<r>[0-9a-fA-F]{1,2})(?<g>[0-9a-fA-F]{1,2})(?<b>[0-9a-fA-F]{1,2})/
  COLOR_TO_HEX  = YAML.load(File.read(File.expand_path("../../data/color_names.yml", __FILE__)))

  def parse(color_string)
    if color_string =~ CSS_RGB_REGEX
      rgb_string_to_color(color_string)
    elsif color_string =~ CSS_HEX_REGEX
      hex_string_to_color(color_string)
    elsif COLOR_TO_HEX.include?(color_string.downcase)
      hex_string_to_color(COLOR_TO_HEX[color_string.downcase])
    else
      return nil
    end
  end

  def hex_string_to_color(color_string)
    match_data = color_string.match(CSS_HEX_REGEX)

    rgb = []
    match_data.captures.each do |component|
      rgb << (component.length == 1 ? (component * 2).hex : component.hex)
    end
    Color.new(*rgb)
  end

  def rgb_string_to_color(color_string)
    match_data = color_string.match(CSS_RGB_REGEX)
    Color.new(*match_data.captures)
  end

end
