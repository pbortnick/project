class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :posts
end
