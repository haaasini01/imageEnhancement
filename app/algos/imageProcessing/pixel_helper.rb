module ImageProcessing
  module PixelUtils

    def self.rgb(pixel)
      [
        ChunkyPNG::Color.r(pixel),
        ChunkyPNG::Color.g(pixel),
        ChunkyPNG::Color.b(pixel)
      ]
    end

    def self.clamp(value)
      [[value, 255].min, 0].max
    end

    def self.to_pixel(r, g, b)
      ChunkyPNG::Color.rgb(clamp(r), clamp(g), clamp(b))
    end

  end
end