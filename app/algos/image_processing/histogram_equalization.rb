module ImageProcessing
  class HistogramEqualization
    def self.apply(image)
      image.equalize
      image
    end
  end
end