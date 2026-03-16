module ImageProcessing
  class EdgeDetection
    def self.apply(image)
      image.edge("2")
      image
    end
  end
end