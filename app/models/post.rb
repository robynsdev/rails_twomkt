class Post < ApplicationRecord
  include PgSearch::Model
  
  pg_search_scope :search, against: [:title, :description]
  pg_search_scope :kinda_matching, 
    against: [:title, :description], 
    using: {tsearch: {dictionary: "english"}}
  # pg_search_scope :sounds_like, 
    # against: [:title, :description], 
    # using: :dmetaphone
  # pg_search_scope :kinda_spelled_like, 
    # against: [:title, :description], 
    # using: :trigram
  pg_search_scope :search_with_cat, 
    against: [:title, :description], 
    associated_against: { category: [:name] }, 
    using: {tsearch: {dictionary: "english"}}
  
  belongs_to :user
  has_one_attached :picture
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
