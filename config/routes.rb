Rails.application.routes.draw do
  resources :requests
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :bands do
    path = "bands"
    resources :artist_bands, only: [:create, :destroy], controller: path + "/artist_bands"
    resources :band_albums, only: [:create, :destroy], controller: path + "/band_albums"
    resources :band_links, only: [:create,:update, :destroy], controller: path + "/band_links"
    resources :band_bookmarks, only: [:create, :destroy], controller: path + "/band_bookmarks"
  end
  resources :albums, only: [:create, :update, :destroy] do
    resources :musics, only: [:create, :update, :destroy], controller: "albums/musics"
    resources :artist_albums, only: [:create, :destroy], controller: "albums/artist_albums"
    resources :album_links, only: [:create, :destroy], controller: "albums/album_links"
  end
  resources :users do
    path = "users/musics"
    resources :musics, only: [:create, :update, :destroy], controller: path do
      resources :composer_musics, only: [:create, :destroy], controller: path + "/composer_musics"
      resources :lyrist_musics, only: [:create, :destroy],  controller: path + "/lyrist_musics"
      resources :bands, only: [:create, :destroy], controller: path + "/bands"
      resources :artist_musics, only: [:create, :destroy], controller: path + "/artist_musics"
      resources :album_musics, only: [:create, :destroy], controller: path + "/album_musics"
      resources :music_bookmarks, only: [:create, :destroy], controller: path + "/music_bookmarks"
      resources :music_links, only: [:create, :update, :destroy], controller: path + "/music_links"
      resources :issues, controller: path + "/issues"
    end
    resources :requests, only: [:create, :update, :destroy], controller: "users/requests"
  end
  resources :artists, only: [:create, :update, :destroy] do
    resources :artist_bookmarks, only: [:create, :destroy], controller: "artists/artist_bookmarks"
    resources :musics, only: [:index, :show], controller: "artists/musics"
    resources :artist_links, only: [:create, :update, :destroy], controller: "artists/artist_links"
    resources :albums, controller: "artists/albums" do
      resources :musics, only: [:index, :show], controller: "artists/albums/musics"
    end
  end
end
