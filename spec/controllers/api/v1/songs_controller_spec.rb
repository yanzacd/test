require 'rails_helper'

describe Api::V1::SongsController do
  describe 'GET #index' do
    context 'when get songs for album' do
      subject(:http_request) { get :index, params: { id: album.spotify_id } }

      let(:album) { Album.first }

      before do
        create(:album)
        album.songs.create(name: Faker::Music.chord, spotify_id: album.spotify_id)
        album.songs.create(name: Faker::Music.chord, spotify_id: album.spotify_id)
        album.songs.create(name: Faker::Music.chord, spotify_id: album.spotify_id)
        album.songs.create(name: Faker::Music.chord, spotify_id: album.spotify_id)
      end

      it 'responds with ok status code' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with four total songs' do
        http_request
        expect(JSON.parse(response.body)['data'].count).to eq 4
      end
    end

    context 'when there are not songs for album' do
      subject(:http_request) { get :index, params: { id: album.spotify_id } }

      let(:album) { Album.first }

      before do
        create(:album)
      end

      it 'responds with ok status code' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with zero total songs' do
        http_request
        expect(JSON.parse(response.body)['data'].count).to eq 0
      end

      it 'responds with []' do
        http_request
        expect(JSON.parse(response.body)['data']).to eq []
      end
    end

    context 'when there is not an album' do
      subject(:http_request) { get :index, params: { id: id } }

      let(:id) { Faker::Code.isbn }

      it 'responds with not found status code' do
        expect(http_request).to have_http_status(:not_found)
      end

      it 'responds with message error Artist not found with that ID' do
        http_request
        expect(
          JSON.parse(response.body)['data'][0]['error']
        ).to eq "Album not found with ID: #{id}"
      end
    end
  end
end
