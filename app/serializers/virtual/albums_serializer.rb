module Virtual
  class AlbumsSerializer
    def execute(response)
      {
        SpotifyConstants::DATA => response.inject([]) do |build_json, album|
          build_json << data_album(album)
        end
      }
    end

    private

    def data_album(album)
      {
        SpotifyConstants::ID => album.spotify_id,
        SpotifyConstants::NAME => album.name,
        SpotifyConstants::IMAGE => album.image,
        SpotifyConstants::SPOTIFY_URL => album.spotify_url,
        SpotifyConstants::TOTAL_TRACKS => album.total_tracks
      }
    end
  end
end
