class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  #:photo represents the column name in the photos table, which is photo
  #PhotoUploader must tally with the column name

end
