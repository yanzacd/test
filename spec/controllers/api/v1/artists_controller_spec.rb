require 'rails_helper'

describe Api::V1::ArtistsController do
  describe 'GET #index' do
    context 'when get artist' do
      subject(:http_request) { get :index }

      before do
        create_list(:artist, 6)
      end

      it 'responds with ok status code' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with paginated json' do
        http_request
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'responds with six total artist' do
        http_request
        expect(JSON.parse(response.body)['page'].count).to eq 6
      end

      it 'responds with two total genres' do
        http_request
        expect(JSON.parse(response.body)['page'][0]['genres'].count).to eq 2
      end
    end

    context 'when there are not artist' do
      subject(:http_request) { get :index }

      it 'responds with ok status code' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with zero total artist' do
        http_request
        expect(JSON.parse(response.body)['page'].count).to eq 0
      end
    end
  end
end
