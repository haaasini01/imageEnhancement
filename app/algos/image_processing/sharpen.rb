module ImageProcessing
  class Sharpen

    KERNEL = [
      [0,-1,0],
      [-1,5,-1],
      [0,-1,0]
    ]

    def self.apply(image)
      Convolution.apply(image, KERNEL)
    end

  end
end