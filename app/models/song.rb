class Song < ApplicationRecord
  belongs_to :artists

  validates :name, presence: true
  validates :length, presence: true 
  alidates :length, length: { maximum: 500 }
end
