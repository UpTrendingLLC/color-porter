# ColorPorter

The easy way to work with with RGB and Hex values in ruby. This code was written during the [48 hour Rails Rumble 13 contest](http://railsrumble.com/) and has been extracted from the code base of [our entry (elementcss.com)](http://railsrumble.com/entries/124-elementcss).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'color_porter'
```

And then execute:

    $ bundle

## Usage

Parse a string and color porter will return an RGB or Hex object if a match is found

```ruby
ColorPorter.parse('#ccc') # => #<ColorPorter::Hex @code="cccccc">
ColorPorter.parse('rgb(204,204,204)') #  => #<ColorPorter::RGB @blue=204, @green=204, @red=204>
```

Do conversions between RGB and Hex

```ruby
hex = ColorPorter::Hex.new('cccccc')
rgb = hex.to_rgb # =>  #<ColorPorter::RGB @blue=204, @green=204, @red=204>
rgb.to_s # => "rgb(204,204,204)"

hex = rgb.to_hex # => #<ColorPorter::Hex @code="cccccc">
hex.to_s # => "#cccccc"
```

Grab the luminosity (brightness) of a RGB or Hex value.

```ruby
hex = ColorPorter::Hex.new('cccccc')
hex.luminosity # => 13421772

rgb = ColorPorter::RGB.new(204,204,204)
rgb.luminosity # => 13421772
```

## Author
[Nathan Bertram](https://github.com/nathanbertram)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Ensure tests are passing with `rspec`
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
7. You da man!