module Api
  module V1
    class GenresController < ApplicationController
      def random_song
        random_song = find_song
        if random_song.nil?
          render json: Errors::NotFoundSong.new.execute(genre_name), status: :not_found
        else
          render json: Virtual::GenresSerializer.new.execute(random_song), status: :ok
        end
      end

      private

      def find_song
        Songs::FindRandom.new.execute(genre_name)
      end

      def genre_name
        params.require(:genre_name)
      end
    end
  end
end
