class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  # Had a triple join Transaction table to record transactions. Couldn't implement in time. TODO.
  
  # has_many :sales, class_name: 'Transaction', foreign_key: :seller_id
  # has_many :purchases, class_name: 'Transaction', foreign_key: :buyer_id

  # has_many :sold_recipes, through: :sales, source: :posts
  # has_many :purchased_recipes, through: :purchases, source: :posts

  # scope :sellers, -> { joins(:sales) }
  # scope :buyers, -> { joins(:purchases) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
