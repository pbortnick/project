class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user, :optional => true
  has_many :comments

  validates_presence_of :title, :body

  validates :title, uniqueness: true

  do_not_validate_attachment_file_type :avatar

  has_attached_file :avatar


end
