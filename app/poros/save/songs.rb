module Save
  class Songs
    def store(songs, album)
      songs.each { |song| save_song(song, album) }
    end

    private

    def save_song(song, album)
      album.songs.create!(
        name: song.name,
        preview_url: song.preview_url,
        duration_ms: song.duration_ms,
        explicit: song.explicit,
        spotify_url: Validations::SpotifyUrl.new.execute(song.external_urls),
        spotify_id: album.spotify_id
      )
    end
  end
end
