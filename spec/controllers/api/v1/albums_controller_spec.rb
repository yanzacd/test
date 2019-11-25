require 'rails_helper'

describe Api::V1::AlbumsController do
  describe 'GET #index' do
    context 'when get album for artist' do
      subject(:http_request) { get :index, params: { id: artist.spotify_id } }

      let(:artist) { Artist.first }

      before do
        create(:artist)
        artist.albums.create(name: Faker::Music.album, spotify_id: artist.spotify_id)
        artist.albums.create(name: Faker::Music.album, spotify_id: artist.spotify_id)
        artist.albums.create(name: Faker::Music.album, spotify_id: artist.spotify_id)
        artist.albums.create(name: Faker::Music.album, spotify_id: artist.spotify_id)
      end

      it 'responds with ok status code' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with paginated json' do
        http_request
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'responds with four total albums' do
        http_request
        expect(JSON.parse(response.body)['page'].count).to eq 4
      end

      it 'responds with five total keys for the first album' do
        http_request
        expect(JSON.parse(response.body)['page'][0].count).to eq 5
      end
    end

    context 'when there are not albums for artist' do
      subject(:http_request) { get :index, params: { id: artist.spotify_id } }

      let(:artist) { Artist.first }

      before do
        create(:artist)
      end

      it 'responds with ok status code' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with zero total albums' do
        http_request
        expect(JSON.parse(response.body)['page'].count).to eq 0
      end

      it 'responds with []' do
        http_request
        expect(JSON.parse(response.body)['page']).to eq []
      end
    end

    context 'when there is not an artist' do
      subject(:http_request) { get :index, params: { id: id } }

      let(:id) { Faker::Code.isbn }

      it 'responds with not found status code' do
        expect(http_request).to have_http_status(:not_found)
      end

      it 'responds with message error Artist not found with that ID' do
        http_request
        expect(JSON.parse(response.body)['error']).to eq "Artist not found with ID: #{id}"
      end
    end
  end
end
