module ImageProcessing
  class Contrast
    def self.apply(image, value)
      value = 0 if value.nil? || value.to_f == 0.0
      image.combine_options do |c|
        c.brightness_contrast "0,#{value}"
      end
      image
    end
  end
end