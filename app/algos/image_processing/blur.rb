module ImageProcessing
  class Blur
    def self.apply(image)
      image.blur("0x8")
      image
    end
  end
end