module ImageProcessing
  class Convolution

    def self.apply(image, kernel)
      width = image.width
      height = image.height
      k_size = kernel.length
      offset = k_size / 2

      # Operate directly on ChunkyPNG's underlying 1D pixel array (extremely fast)
      pixels = image.pixels
      result_pixels = pixels.dup

      # Pre-calculate kernel as a 1D offset to avoid nested math loops per-pixel
      flat_kernel = []
      k_size.times do |ky|
        k_size.times do |kx|
          weight = kernel[ky][kx]
          next if weight == 0
          flat_kernel << { offset: (ky - offset) * width + (kx - offset), weight: weight }
        end
      end

      y_start = offset
      y_end = height - offset
      x_start = offset
      x_end = width - offset

      y = y_start
      while y < y_end
        x = x_start
        idx = y * width + x
        
        while x < x_end
          r_sum = 0.0
          g_sum = 0.0
          b_sum = 0.0
          
          # Fast pass over kernel
          flat_kernel.each do |k|
            p = pixels[idx + k[:offset]]
            w = k[:weight]
            
            # Extract R, G, B via bitwise operations (pixels are RRGGBBAA 32-bit integers)
            r_sum += ((p >> 24) & 0xff) * w
            g_sum += ((p >> 16) & 0xff) * w
            b_sum += ((p >> 8) & 0xff) * w
          end
          
          r = r_sum.round
          g = g_sum.round
          b = b_sum.round
          
          # Fast clamping
          r = 255 if r > 255
          r = 0 if r < 0
          g = 255 if g > 255
          g = 0 if g < 0
          b = 255 if b > 255
          b = 0 if b < 0
          
          # Preserve the original alpha channel
          orig_a = pixels[idx] & 0xff
          
          # Repack the integer
          result_pixels[idx] = (r << 24) | (g << 16) | (b << 8) | orig_a
          
          x += 1
          idx += 1
        end
        y += 1
      end

      ChunkyPNG::Image.new(width, height, result_pixels)
    end

  end
end