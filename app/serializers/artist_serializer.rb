class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :genres, :popularity, :spotify_url

  private

  def id
    object.spotify_id
  end
end
