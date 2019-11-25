require 'rails_helper'

describe Api::V1::GenresController do
  describe 'GET #random_song' do
    context 'when get song with a genre for a random artist' do
      subject(:http_request) { get :random_song, params: { genre_name: genre_name } }

      let(:genre_name) { Faker::Music.genre }

      before do
        create(:artist, genres: [genre_name])
        Artist.first.albums.create(name: Faker::Music.album, spotify_id: Artist.first.spotify_id)
        Artist.first.albums.create(name: Faker::Music.album, spotify_id: Artist.first.spotify_id)
        Album.first.songs.create(name: Faker::Music.chord, spotify_id: Artist.first.spotify_id)
        Album.first.songs.create(name: Faker::Music.chord, spotify_id: Artist.first.spotify_id)
        Album.first.songs.create(name: Faker::Music.chord, spotify_id: Artist.first.spotify_id)
        Album.first.songs.create(name: Faker::Music.chord, spotify_id: Artist.first.spotify_id)
      end

      it 'responds with ok status code' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with five total keys for a song' do
        http_request
        expect(JSON.parse(response.body)['data'].count).to eq 5
      end
    end

    context 'when there are not song for artist' do
      subject(:http_request) { get :random_song, params: { genre_name: genre_name } }

      let(:genre_name) { Faker::Music.genre }

      before do
        create(:artist)
      end

      it 'responds with not_found status code' do
        expect(http_request).to have_http_status(:not_found)
      end

      it 'responds with zero total albums' do
        http_request
        expect(
          JSON.parse(response.body)['data'][0]['error']
        ).to eq "Song not found with genre: #{genre_name}"
      end
    end

    context 'when there is not an artist' do
      subject(:http_request) { get :random_song, params: { genre_name: genre_name } }

      let(:genre_name) { Faker::Music.genre }

      it 'responds with not found status code' do
        expect(http_request).to have_http_status(:not_found)
      end

      it 'responds with message error Artist not found with that ID' do
        http_request
        expect(
          JSON.parse(response.body)['data'][0]['error']
        ).to eq "Song not found with genre: #{genre_name}"
      end
    end
  end
end
