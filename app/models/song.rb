class Song < ApplicationRecord
  validates :name, :duration_ms, :spotify_id, presence: true

  has_and_belongs_to_many :albums
end
