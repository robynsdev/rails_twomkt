class Post < ApplicationRecord
  include PgSearch::Model
  
  pg_search_scope :kinda_matching, 
    against: [:title, :description], 
    using: {tsearch: {dictionary: "english"}}

  # Would like to implement other searches in the future. Couldn't get them working in time.
  # pg_search_scope :sounds_like, 
    # against: [:title, :description], 
    # using: :dmetaphone
  # pg_search_scope :kinda_spelled_like, 
    # against: [:title, :description], 
    # using: :trigram
  
  belongs_to :user
  has_one_attached :picture
  has_and_belongs_to_many :categories
  has_many :offers, dependent: :destroy

  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

end
