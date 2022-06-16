class Artist < ApplicationRecord
  belongs_to :billboard
  has_many :songs


  validates :name, presence: true
  validates :album, presence: true
  validates :songs, presence: true
  
end
