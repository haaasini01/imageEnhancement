module ImageProcessing
  class Convolution

    def self.apply(image, kernel)

      width = image.width
      height = image.height
      k_size = kernel.length
      offset = k_size / 2

      result = image.dup

      (offset...(height-offset)).each do |y|
        (offset...(width-offset)).each do |x|

          r_sum = 0
          g_sum = 0
          b_sum = 0

          k_size.times do |ky|
            k_size.times do |kx|

              px = x + kx - offset
              py = y + ky - offset

              pixel = image[px,py]

              r,g,b = PixelUtils.rgb(pixel)

              weight = kernel[ky][kx]

              r_sum += r * weight
              g_sum += g * weight
              b_sum += b * weight

            end
          end

          result[x,y] = PixelUtils.to_pixel(r_sum, g_sum, b_sum)

        end
      end

      result
    end

  end
end