class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :book, :user

  belongs_to :book, serializer: BookAltSerializer
  belongs_to :user
end
