Rails.application.routes.draw do
  resources :music_links
  resources :links
  post "/graphql", to: "graphql#execute"
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :requests, only: [:index, :show]
  resources :musics, only: [:index, :show] do
  end
  resources :bands do
    path = "bands"
    resources :artist_bands, only: [:create, :destroy], controller: path + "/artist_bands"
    resources :band_albums, only: [:create, :destroy], controller: path + "/band_albums"
    resources :band_bookmarks, only: [:create, :destroy], controller: path + "/band_bookmarks"
  end
  resources :albums do
    resources :artist_albums, only: [:create, :destroy], controller: "albums/artist_albums"
    resources :musics, controller: "albums/musics"
  end
  resources :users, only: [:index, :show] do
    path = "users/musics"
    resources :musics, controller: path do
      resources :composers, only: [:create, :destroy], controller: path + "/composers"
      resources :lyrists, only: [:create, :destroy],  controller: path + "/lyrists"
      resources :bands, only: [:create, :destroy], controller: path + "/bands"
      resources :artist_musics, only: [:create, :destroy], controller: path + "/artist_musics"
      resources :album_musics, only: [:create, :destroy], controller: path + "/album_musics"
      resources :music_bookmarks, only: [:create, :destroy], controller: path + "/music_bookmarks"
      resources :issues, controller: path + "/issues"
    end
    resources :requests, controller: "users/requests"
  end
  resources :artists do
    resources :artist_bookmarks, only: [:create, :destroy], controller: "artists/artist_bookmarks"
    resources :musics, only: [:index, :show], controller: "artists/musics"
    resources :albums, controller: "artists/albums" do
      resources :musics, only: [:index, :show], controller: "artists/albums/musics"
    end
  end
end
