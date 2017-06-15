class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  #:photo_url represents the column name in the photos table, which is photo_url
  #PhotoUploader must tally with the column name

end
