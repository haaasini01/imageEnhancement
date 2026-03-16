module ImageProcessing
  class Sharpen
    def self.apply(image)
      image.sharpen("0x3")
      image
    end
  end
end