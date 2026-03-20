module ImageProcessing
  class CartoonEffect
    def self.apply(image)
      # Reduce colors and add bold edges for cartoon effect
      image.modulate(100, 150) # Increase saturation
      image.posterize(6) # Reduce to 6 levels per channel
      image.edge(3) # Detect edges
      image.negate # Invert edges for darker outlines
      image.normalize
      image
    end
  end
end
