module ImageProcessing
  class Blur

    KERNEL = [
      [1.0/25,1.0/25,1.0/25,1.0/25,1.0/25],
      [1.0/25,1.0/25,1.0/25,1.0/25,1.0/25],
      [1.0/25,1.0/25,1.0/25,1.0/25,1.0/25],
      [1.0/25,1.0/25,1.0/25,1.0/25,1.0/25],
      [1.0/25,1.0/25,1.0/25,1.0/25,1.0/25]
    ]

    def self.apply(image)
      Convolution.apply(image, KERNEL)
    end

  end
end