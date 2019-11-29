class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :spotify_url, :total_tracks

  private

  def id
    object.spotify_id
  end
end
