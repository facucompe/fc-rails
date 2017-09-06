class BookSerializer < ActiveModel::Serializer
  attributes :author, :genre, :image, :title, :publisher, :year
  def image
    { url: object.image }
  end
end