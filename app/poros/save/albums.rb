module Save
  class Albums
    def store(albums, artist)
      albums.each { |album| save_album(album, artist) }
    end

    private

    def save_album(album, artist)
      current_album = artist.albums.create(
        name: album.name,
        image: Validations::Image.new.execute(album.images),
        total_tracks: album.total_tracks,
        spotify_url: Validations::SpotifyUrl.new.execute(album.external_urls),
        spotify_id: artist.spotify_id
      )
      Save::Songs.new.store(album.tracks, current_album)
    end
  end
end
