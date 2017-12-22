class Post < ApplicationRecord
  belongs_to :category

  validates_presence_of :title, :body

  do_not_validate_attachment_file_type :avatar

  has_attached_file :avatar



end
