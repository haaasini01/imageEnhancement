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

    if filter == :brightness
        value = params[:value].to_i
        result = ImageProcessor.apply(image, filter, value)

    elsif filter == :contrast
        value = params[:value].to_f
        result = ImageProcessor.apply(image, filter, value)

    else
        result = ImageProcessor.apply(image, filter)
    end

    filename = "processed_#{Time.now.to_i}.png"
    output_path = Rails.root.join("public", filename)

    result.save(output_path)
    
    # Save original image to display it
    orig_filename = "orig_#{Time.now.to_i}#{File.extname(uploaded_file.original_filename)}"
    orig_output_path = Rails.root.join("public", orig_filename)
    FileUtils.cp(uploaded_file.path, orig_output_path)

    @output_image = "/#{filename}"
    @input_image = "/#{orig_filename}"

    render :result
    end
end