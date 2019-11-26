module Api
  module V1
    class SongsController < ApplicationController
      def index
        if album.nil?
          render json: Errors::NotFoundAlbum.new.execute(album_id), status: :not_found
        else
          render json: Virtual::SongsSerializer.new.execute(album.songs), status: :ok
        end
      end

      private

      def album_id
        params.require(:id)
      end

      def album
        Album.find_by(spotify_id: album_id)
      end
    end
  end
end
