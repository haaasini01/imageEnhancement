module ImageProcessing
  class Brightness
    def self.apply(image, value)
      value = 100 if value <= 0
      image.modulate("#{value},100")
      image
    end
  end
end