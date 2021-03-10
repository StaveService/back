Rails.application.routes.draw do
  resources :requests
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :musics, only: [:index, :show]
  resources :albums do
    resources :musics, controller: "albums/musics"
  end
  resources :users, only: [:index, :show] do
    resources :musics, controller: "users/musics"
    resources :request, controller: "users/request"
  end
  resources :artists do
    resources :musics, only: [:index, :show], controller: "artists/musics"
    resources :albums, controller: "artists/albums" do
      resources :musics, only: [:index, :show], controller: "artists/albums/musics"
    end
  end
end
