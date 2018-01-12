class Category < ApplicationRecord
  has_many :posts

  accepts_nested_attributes_for :posts

  validates_presence_of :title

  validates :title, uniqueness: true

  def name
    "#{title}"
  end

end
