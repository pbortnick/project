class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :avatar, :category_id
  belongs_to :category
end
