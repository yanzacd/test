module Spotify
  class ImportData
    def find_info_artist(artists)
      artists.values[0].each do |artist|
        store_data(RSpotify::Artist.search(artist.to_s))
      end
    end

    private

    def store_data(response_from_spotify)
      Save::Artists.new.store(response_from_spotify) unless response_from_spotify == []
    end
  end
end
