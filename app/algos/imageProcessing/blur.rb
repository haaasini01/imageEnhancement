module ImageProcessing
  class Blur

    KERNEL = [
      [1.0/9,1.0/9,1.0/9],
      [1.0/9,1.0/9,1.0/9],
      [1.0/9,1.0/9,1.0/9]
    ]

    def self.apply(image)
      Convolution.apply(image, KERNEL)
    end

  end
end