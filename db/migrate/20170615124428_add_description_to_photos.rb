class AddDescriptionToPhotos < ActiveRecord::Migration[5.1]
  def change
  	add_column :photos, :description, :json
  end
end
