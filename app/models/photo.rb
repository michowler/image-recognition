class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_integrity_of :image
  validates_processing_of :image
  validates_format_of :image, :with => %r{\.(png|jpg|jpeg)\z}i, :error => "Please use valid formats for your pictures. (JPG,PNG,JPEG)"
  #:photo_url represents the column name in the photos table, which is photo_url
  #PhotoUploader must tally with the column name

end
