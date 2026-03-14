module ImageProcessing
  class Brightness

    def self.apply(image, value)

      result = image.dup

      image.height.times do |y|
        image.width.times do |x|

          r,g,b = PixelUtils.rgb(image[x,y])

          r += value
          g += value
          b += value

          result[x,y] = PixelUtils.to_pixel(r,g,b)

        end
      end

      result
    end

  end
end