class Billboard < ApplicationRecord
    has_many :artists

    validates :genre, presence: true
    validates :topArtist, presence: true
    validates :picture, presence: true
end
