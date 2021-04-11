Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :requests, only: [:index, :show]
  resources :musics, only: [:index, :show] do
    resources :music_stars
  end
  resources :bands do
    resources :artist_bands, only: [:create, :destroy], controller: "bands/artist_bands"
    resources :band_albums, only: [:create, :destroy], controller: "bands/band_albums"
    resources :band_stars
  end
  resources :albums do
    resources :artist_albums, only: [:create, :destroy], controller: "albums/artist_albums"
    resources :musics, controller: "albums/musics"
  end
  resources :users, only: [:index, :show] do
    resources :musics, controller: "users/musics" do
      resources :composers, only: [:create, :destroy], controller: "users/musics/composers"
      resources :lyrists, only: [:create, :destroy],  controller: "users/musics/lyrists"
      resources :bands, only: [:create, :destroy], controller: "users/musics/bands"
      resources :roles, only: [:create, :destroy], controller: "users/musics/roles"
      resources :album_musics, only: [:create, :destroy], controller: "users/musics/album_musics"
      resources :issues, controller: "users/musics/issues"
    end
    resources :requests, controller: "users/requests"
  end
  resources :artists do
    resources :artist_stars
    resources :musics, only: [:index, :show], controller: "artists/musics"
    resources :albums, controller: "artists/albums" do
      resources :musics, only: [:index, :show], controller: "artists/albums/musics"
    end
  end
end
