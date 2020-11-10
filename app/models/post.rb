class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
