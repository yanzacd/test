module Save
  class Artists
    def store(artists)
      artists.each { |artist| save_artist(artist) }
    end

    private

    def save_artist(artist)
      current_artist = Artist.create!(
        name: artist.name,
        image: Validations::Image.new.execute(artist.images),
        popularity: artist.popularity,
        spotify_url: Validations::SpotifyUrl.new.execute(artist.external_urls),
        genres: artist.genres,
        spotify_id: artist.id
      )
      Save::Albums.new.store(artist.albums, current_artist)
    end
  end
end
