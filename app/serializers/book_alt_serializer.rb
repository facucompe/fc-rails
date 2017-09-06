class BookAltSerializer < ActiveModel::Serializer
  attributes :author, :genre, :image_url, :title, :publisher, :year
  def image_url
    object.image
  end
end
