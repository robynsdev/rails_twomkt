class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
