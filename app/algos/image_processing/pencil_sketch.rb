module ImageProcessing
  class PencilSketch
    def self.apply(image)
      # Create sketch effect using edge detection and inversion
      image.colorspace "Gray"
      # Duplicate for layer blending effect
      image.combine_options do |cmd|
        cmd.shade "120x45"
      end
      image
    end
  end
end
