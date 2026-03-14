require "chunky_png"

class ImagesController < ApplicationController

  def index   # automatically loads app/views/images/index.html.erb
  end


  def enhance
    uploaded_file = params[:image]

    unless uploaded_file
        redirect_to root_path, alert: "Please upload an image"
        return
    end

    image = ChunkyPNG::Image.from_file(uploaded_file.path)

    filter = params[:filter].to_sym

    case filter
    when :brightness
        value = params[:value].to_i
        result = ImageProcessor.apply(image, filter, value)

    when :contrast
        value = params[:value].to_f
        result = ImageProcessor.apply(image, filter, value)

    else
        result = ImageProcessor.apply(image, filter)
    end

    output_path = Rails.root.join("tmp", "processed.png")

    result.save(output_path)

    send_file output_path,
                type: "image/png",
                disposition: "inline"

    end




end