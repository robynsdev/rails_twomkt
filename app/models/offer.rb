class Offer < ApplicationRecord
  belongs_to :post

  validates :amount, presence: true, numericality: { only_integer: true }
end
