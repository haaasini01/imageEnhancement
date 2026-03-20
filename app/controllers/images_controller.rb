require "mini_magick"

class ImagesController < ApplicationController

  def index   # automatically loads app/views/images/index.html.erb
  end


    def enhance
    uploaded_file = params[:image]

    unless uploaded_file
        redirect_to root_path, alert: "Please upload an image"
        return
    end

    image = MiniMagick::Image.open(uploaded_file.path)

    filter = params[:filter].to_sym

    if filter == :brightness
        value = params[:value].to_i
        result = ImageProcessor.apply(image, filter, value)

    elsif filter == :contrast
        value = params[:value].to_f
        result = ImageProcessor.apply(image, filter, value)

    elsif filter == :oil_painting
        radius = params[:radius].to_i
        radius = 4 if radius.zero?
        result = ImageProcessor.apply(image, filter, radius)

    elsif filter == :watercolor
        intensity = params[:intensity].to_i
        intensity = 3 if intensity.zero?
        result = ImageProcessor.apply(image, filter, intensity)

    else
        result = ImageProcessor.apply(image, filter)
    end

    ext = File.extname(uploaded_file.original_filename).downcase
    ext = ".jpg" if ext.empty?
    
    filename = "processed_#{Time.now.to_i}#{ext}"
    output_path = Rails.root.join("public", filename)

    result.write(output_path.to_s)
    
    # Save original image to display it
    orig_filename = "orig_#{Time.now.to_i}#{ext}"
    orig_output_path = Rails.root.join("public", orig_filename)
    FileUtils.cp(uploaded_file.path, orig_output_path)

    @output_image = "/#{filename}"
    @input_image = "/#{orig_filename}"

    render :result
    end
end