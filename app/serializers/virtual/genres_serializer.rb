module Virtual
  class GenresSerializer
    def execute(response)
      {
        SpotifyConstants::DATA => data_song(response)
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
