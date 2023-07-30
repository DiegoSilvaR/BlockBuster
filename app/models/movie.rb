class Movie < ApplicationRecord
  belongs_to :client, optional: true
  attribute :cover_image_url, :string # Agregamos el atributo para la URL de la imagen

  def to_s
    name
  end
end
