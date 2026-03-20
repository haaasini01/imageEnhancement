require_relative "image_processing/blur"
require_relative "image_processing/sharpen"
require_relative "image_processing/edge_detection"
require_relative "image_processing/brightness"
require_relative "image_processing/contrast"
require_relative "image_processing/histogram_equalization"
require_relative "image_processing/grayscale"
require_relative "image_processing/cartoon_effect"
require_relative "image_processing/pencil_sketch"
require_relative "image_processing/oil_painting"
require_relative "image_processing/watercolor"
require_relative "image_processing/vintage_sepia"

class ImageProcessor

  FILTERS = {
    blur: ImageProcessing::Blur,
    sharpen: ImageProcessing::Sharpen,
    edge_detection: ImageProcessing::EdgeDetection,
    brightness: ImageProcessing::Brightness,
    contrast: ImageProcessing::Contrast,
    histogram_equalization: ImageProcessing::HistogramEqualization,
    grayscale: ImageProcessing::Grayscale,
    cartoon_effect: ImageProcessing::CartoonEffect,
    pencil_sketch: ImageProcessing::PencilSketch,
    oil_painting: ImageProcessing::OilPainting,
    watercolor: ImageProcessing::Watercolor,
    vintage_sepia: ImageProcessing::VintageSepia
  }

  def self.apply(image, filter, *args)

    processor = FILTERS[filter]

    raise "Unknown filter" unless processor

    processor.apply(image, *args)

  end

end