module Api
  module V1
    class AlbumsController < ApplicationController
      def index
        if artist.nil?
          render json: Errors::NotFoundArtist.new.execute(artist_id), status: :not_found
        else
          render json: Virtual::AlbumsSerializer.new.execute(artist.albums), status: :ok
        end
      end

      private

      def artist_id
        params.require(:id)
      end

      def artist
        Artist.find_by(spotify_id: artist_id)
      end
    end
  end
end
