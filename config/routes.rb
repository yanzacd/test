Rails.application.routes.draw do
  root to: 'application#index'

  api_version(module: 'Api::V1', path: { value: 'api/v1' }) do
    resources :artists, only: [:index] do
      member do
        resources :albums, only: [:index]
      end
    end

    resources :albums, except: %i[index create show destroy update] do
      member do
        resources :songs, only: [:index]
      end
    end

    resources :genres, param: :name, except: %i[index create show destroy update] do
      get :random_song
    end
  end
end
