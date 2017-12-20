class Post < ApplicationRecord
  belongs_to :category

  validates_presence_of :title, :body

  has_attached_file :avatar

  acts_as_votable
end
