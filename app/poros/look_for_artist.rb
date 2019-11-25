class LookForArtist
  def execute(genre_name)
    @artist_random = nil
    Artist.each do |artist|
      if artist.genre.include?(genre_name)
        @artist_random = artist
        break
      end
    end
    @artist_random
  end
end
