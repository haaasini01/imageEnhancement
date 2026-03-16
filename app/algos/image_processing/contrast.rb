module ImageProcessing
  class Contrast

    def self.apply(image, factor)

      result = image.dup

      image.height.times do |y|
        image.width.times do |x|

          r,g,b = PixelUtils.rgb(image[x,y])

          r = (r - 128) * factor + 128
          g = (g - 128) * factor + 128
          b = (b - 128) * factor + 128

          result[x,y] = PixelUtils.to_pixel(r,g,b)

        end
      end

      result
    end

  end
end