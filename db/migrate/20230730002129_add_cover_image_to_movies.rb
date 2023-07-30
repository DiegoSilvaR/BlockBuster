class AddCoverImageToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :cover_image, :string
  end
end
