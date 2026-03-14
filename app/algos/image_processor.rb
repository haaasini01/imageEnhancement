require_relative "image_processing/blur"
require_relative "image_processing/sharpen"
require_relative "image_processing/edge_detection"
require_relative "image_processing/brightness"
require_relative "image_processing/contrast"
require_relative "image_processing/histogram_equalization"

class ImageProcessor

  FILTERS = {
    blur: ImageProcessing::Blur,
    sharpen: ImageProcessing::Sharpen,
    edge_detection: ImageProcessing::EdgeDetection,
    brightness: ImageProcessing::Brightness,
    contrast: ImageProcessing::Contrast,
    histogram_equalization: ImageProcessing::HistogramEqualization
  }

  def self.apply(image, filter, *args)

    processor = FILTERS[filter]

    raise "Unknown filter" unless processor

    processor.apply(image, *args)

  end

end