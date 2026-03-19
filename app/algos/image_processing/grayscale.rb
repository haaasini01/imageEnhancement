module ImageProcessing
  class Grayscale
    def self.apply(image)
      image.colorspace "Gray"
      image
    end
  end
end
