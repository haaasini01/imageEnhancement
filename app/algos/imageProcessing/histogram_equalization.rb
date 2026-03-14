module ImageProcessing
  class HistogramEqualization

    def self.apply(image)

      histogram = Array.new(256,0)

      image.height.times do |y|
        image.width.times do |x|

          r,g,b = PixelUtils.rgb(image[x,y])
          gray = (0.299*r + 0.587*g + 0.114*b).to_i

          histogram[gray] += 1

        end
      end

      cdf = histogram.cumsum

      total = image.width * image.height

      result = image.dup

      image.height.times do |y|
        image.width.times do |x|

          r,g,b = PixelUtils.rgb(image[x,y])
          gray = (0.299*r + 0.587*g + 0.114*b).to_i

          new_val = (cdf[gray] * 255 / total)

          result[x,y] = PixelUtils.to_pixel(new_val,new_val,new_val)

        end
      end

      result
    end

  end
end