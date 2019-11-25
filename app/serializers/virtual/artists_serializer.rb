module Virtual
  class ArtistsSerializer
    def execute(response)
      {
        SpotifyConstants::DATA => response.inject([]) do |build_json, artist|
          build_json << data_artist(artist)
        end
      }
    end

    private

    def data_artist(artist)
      {
        SpotifyConstants::ID => artist.spotify_id,
        SpotifyConstants::NAME => artist.name,
        SpotifyConstants::IMAGE => artist.image,
        SpotifyConstants::GENRES => artist.genres,
        SpotifyConstants::POPULARITY => artist.popularity,
        SpotifyConstants::SPOTIFY_URL => artist.spotify_url
      }
    end
  end
end
