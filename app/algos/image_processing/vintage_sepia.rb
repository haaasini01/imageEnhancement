module ImageProcessing
  class VintageSepia
    def self.apply(image)
      # Apply sepia tone for vintage effect
      image.sepia(0.8)
      # Reduce brightness slightly for aged look
      image.modulate(95, 100)
      # Add slight color shift to warm tones
      image.colorspace "sRGB"
      image
    end
  end
end
