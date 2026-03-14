# sobel edge detection

module ImageProcessing
  class EdgeDetection

    GX = [
      [-1,0,1],
      [-2,0,2],
      [-1,0,1]
    ]

    GY = [
      [-1,-2,-1],
      [0,0,0],
      [1,2,1]
    ]

    def self.apply(image)

      gx = Convolution.apply(image, GX)
      gy = Convolution.apply(image, GY)

      result = image.dup

      image.height.times do |y|
        image.width.times do |x|

          px = gx[x,y]
          py = gy[x,y]

          r = Math.sqrt(
            ChunkyPNG::Color.r(px)**2 +
            ChunkyPNG::Color.r(py)**2
          )

          g = Math.sqrt(
            ChunkyPNG::Color.g(px)**2 +
            ChunkyPNG::Color.g(py)**2
          )

          b = Math.sqrt(
            ChunkyPNG::Color.b(px)**2 +
            ChunkyPNG::Color.b(py)**2
          )

          result[x,y] = PixelUtils.to_pixel(r,g,b)

        end
      end

      result
    end

  end
end