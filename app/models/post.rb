class Post < ApplicationRecord

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
