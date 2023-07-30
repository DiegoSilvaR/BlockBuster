class ChangeCoverImageToCoverImageUrlInMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :cover_image, :cover_image_url
  end
end
