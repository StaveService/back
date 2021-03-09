Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :musics
  resources :albums do
    resources :musics, controller: "albums/musics"
  end
  resources :users, only: [:index, :show] do
    resources :musics, only: [:index, :show, :create], controller: "users/musics"
  end
  resources :artists do
    resources :musics, only: [:index, :show], controller: "artists/musics"
    resources :albums, controller: "artists/albums" do
      resources :musics, only: [:index, :show], controller: "artists/albums/musics"
    end
  end
end
