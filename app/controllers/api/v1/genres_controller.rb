module Api
  module V1
    class GenresController < ApplicationController
      def random_song
        render_paginated response, status: :ok
      end

      private

      def response
        current_artist = Artist.all.each do |artist|
          return artist if artist.genres.include?(genre_name)
        end
        song(current_artist)
      end

      def song(artist)
        Song.find_by(spotify_id: artist.spotify_id)
      end

      def genre_name
        params.require(:genre_name)
      end

      # def look_for_artist(genre_name)
      #   ::LookForArtist.new.execute(genre_name)
      # end
    end
  end
end
