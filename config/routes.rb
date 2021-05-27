Rails.application.routes.draw do
  resources :requests
  post '/graphql', to: 'graphql#execute'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :bands do
    path = 'bands'
    resources :artist_bands, only: %i[create destroy], controller: "#{path}/artist_bands"
    resources :band_albums, only: %i[create destroy], controller: "#{path}/band_albums"
    resources :band_links, only: %i[create update destroy], controller: "#{path}/band_links"
    resources :band_bookmarks, only: %i[create destroy], controller: "#{path}/band_bookmarks"
  end
  resources :albums, only: %i[create update destroy] do
    resources :musics, only: %i[create update destroy], controller: 'albums/musics'
    resources :artist_albums, only: %i[create destroy], controller: 'albums/artist_albums'
    resources :album_links, only: %i[create destroy], controller: 'albums/album_links'
  end
  resources :users do
    path = 'users/musics'
    resources :musics, only: %i[create update destroy], controller: path do
      resources :composer_musics, only: %i[create destroy], controller: "#{path}/composer_musics"
      resources :lyrist_musics, only: %i[create destroy], controller: "#{path}/lyrist_musics"
      resources :bands, only: %i[create destroy], controller: "#{path}/bands"
      resources :artist_musics, only: %i[create destroy], controller: "#{path}/artist_musics"
      resources :album_musics, only: %i[create destroy], controller: "#{path}/album_musics"
      resources :music_bookmarks, only: %i[create destroy], controller: "#{path}/music_bookmarks"
      resources :music_links, only: %i[create update destroy], controller: "#{path}/music_links"
      resources :issues, controller: "#{path}/issues"
    end
    resources :requests, only: %i[create update destroy], controller: 'users/requests'
  end
  resources :artists, only: %i[create update destroy] do
    resources :artist_bookmarks, only: %i[create destroy], controller: 'artists/artist_bookmarks'
    resources :musics, only: %i[index show], controller: 'artists/musics'
    resources :artist_links, only: %i[create update destroy], controller: 'artists/artist_links'
    resources :albums, controller: 'artists/albums' do
      resources :musics, only: %i[index show], controller: 'artists/albums/musics'
    end
  end
end
