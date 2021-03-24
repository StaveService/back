Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :lyrists, only: [:index, :show]
  resources :composers, only: [:index, :show]
  resources :bands
  resources :issues, only: [:index, :show]
  resources :requests, only: [:index, :show]
  resources :musics, only: [:index, :show]
  resources :albums do
    resources :musics, controller: "albums/musics"
  end
  resources :users, only: [:index, :show] do
    resources :musics, controller: "users/musics"
    resources :requests, controller: "users/requests"
  end
  resources :artists do
    resources :musics, only: [:index, :show], controller: "artists/musics"
    resources :albums, controller: "artists/albums" do
      resources :musics, only: [:index, :show], controller: "artists/albums/musics"
    end
  end
end
