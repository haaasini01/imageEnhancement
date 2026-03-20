module ImageProcessing
  class OilPainting
    def self.apply(image, radius = 4)
      # Apply oil painting effect
      image.paint(radius)
      image
    end
  end
end
