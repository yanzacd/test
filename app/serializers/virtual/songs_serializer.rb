module Virtual
  class SongsSerializer
    def execute(response)
      {
        SpotifyConstants::DATA => response.inject([]) do |build_json, song|
          build_json << data_song(song)
        end
      }
    end

    private

    def data_song(song)
      {
        SpotifyConstants::NAME => song.name,
        SpotifyConstants::SPOTIFY_URL => song.spotify_url,
        SpotifyConstants::PREVIEW_URL => song.preview_url,
        SpotifyConstants::DURATION_MS => song.duration_ms,
        SpotifyConstants::EXPLICIT => song.explicit
      }
    end
  end
end
