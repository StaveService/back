Rails.application.routes.draw do
  resources :music_stars
  resources :artist_stars
  resources :band_stars
  resources :band_albums
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :lyrists, only: [:index, :show]
  resources :composers, only: [:index, :show]
  resources :issues, only: [:index, :show]
  resources :requests, only: [:index, :show]
  resources :musics, only: [:index, :show]
  resources :bands do
    resources :artist_bands, only: [:create, :destroy], controller: "bands/artist_bands"
    resources :band_albums, only: [:create, :destroy], controller: "bands/band_albums"
  end
  resources :albums do
    resources :musics, controller: "albums/musics"
  end
  resources :users, only: [:index, :show] do
    resources :musics, controller: "users/musics" do
      resources :composers, only: [:create, :destroy], controller: "users/musics/composers"
      resources :lyrists, only: [:create, :destroy],  controller: "users/musics/lyrists"
      resources :bands, only: [:create, :destroy], controller: "users/musics/bands"
      resources :roles, only: [:create, :destroy], controller: "users/musics/roles"
      resources :album_musics, only: [:create, :destroy], controller: "users/musics/album_musics"
    end
    resources :requests, controller: "users/requests"
  end
  resources :artists do
    resources :musics, only: [:index, :show], controller: "artists/musics"
    resources :albums, controller: "artists/albums" do
      resources :musics, only: [:index, :show], controller: "artists/albums/musics"
    end
  end
end
