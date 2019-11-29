module Songs
  class FindRandom
    def execute(genre, random_artist = nil)
      Artist.all.sample(50).each do |artist|
        if artist.genres.include?(genre)
          random_artist = artist
          break
        end
      end
      return data_song(random_artist) unless random_artist.nil?

      random_artist
    end

    private

    def data_song(artist)
      Song.find_by(spotify_id: artist.spotify_id)
    end
  end
end
