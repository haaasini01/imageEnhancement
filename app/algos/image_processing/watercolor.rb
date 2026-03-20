module ImageProcessing
  class Watercolor
    def self.apply(image, intensity = 3)
      # Create watercolor effect combination
      # Add slight blur for watercolor diffusion
      image.blur("0x#{intensity}")
      # Increase saturation for vivid colors
      image.modulate(100, 130)
      # Add some posterization for color simplification
      image.posterize(8)
      image
    end
  end
end
