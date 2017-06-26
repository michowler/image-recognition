class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  #process scale: [1184, 666]
  # process :process_original_version
  #
  process resize_and_pad: [640, 480, background = :transparent, gravity = 'Center']
  # process :resize_to_limit => [640, 480] 
  def scale(width, height)
    # do something
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [640, 480]
  end
 
  # def process_original_version
  #   image = ::MiniMagick::Image::read(File.binread(@file.file))
  #     if image[:width] > image[:height]
  #       resize_to_fill 450, 300
  #     else
  #       resize_to_fill 300, 450
  #     end
  # end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    flash[:notice] = "Please upload valid files only jpg, jpeg or png" if !%w(jpg jpeg png)

  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
