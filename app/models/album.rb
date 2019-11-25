class Album < ApplicationRecord
  validates :name, :total_tracks, :spotify_id, presence: true

  has_and_belongs_to_many :artists
  has_and_belongs_to_many :songs
end
