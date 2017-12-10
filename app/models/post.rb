class Post < ApplicationRecord
  belongs_to :category

  has_attached_file :avatar
end
