module Api
  module V1
    class ArtistsController < ApplicationController
      def index
        render json: Virtual::ArtistsSerializer.new.execute(
          Artist.order(popularity: :desc)
        ), status: :ok
      end
    end
  end
end
