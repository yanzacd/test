class Artist < ApplicationRecord
  validates :name, :popularity, :spotify_id, presence: true

  has_and_belongs_to_many :albums
end
