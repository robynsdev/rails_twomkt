class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
