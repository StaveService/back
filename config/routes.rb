Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :requests
  resources :bands do
    scope module: :bands do
      resources :artist_bands, path: :artists, only: %i[create destroy]
      resources :band_albums, path: :albums, only: %i[create destroy]
      resources :band_links, path: :links, only: %i[update]
      resources :band_bookmarks, path: :bookmarks, only: %i[create destroy]
    end
  end
  resources :albums, only: %i[create update destroy] do
    scope module: :albums do
      resources :musics, only: %i[create update destroy]
      resources :artist_albums, path: :artists, only: %i[create destroy]
      resources :album_links, path: :links, only: %i[update]
    end
  end
  resources :users do
    scope module: :users do
      resources :musics, only: %i[create update destroy] do
        scope module: :musics do
          resources :bands, only: %i[create destroy]
          resources :composer_musics, path: :composers, only: %i[create destroy]
          resources :lyrist_musics, path: :lyrists, only: %i[create destroy]
          resources :artist_musics, path: :artists, only: %i[create destroy]
          resources :album_musics, path: :albums, only: %i[create destroy]
          resources :music_bookmarks, path: :bookmarks, only: %i[create destroy]
          resources :music_links, path: :links, only: %i[update]
          resources :issues
        end
      end
      resources :requests, only: %i[create update destroy]
      resources :user_links, path: :links, only: %i[update]
    end
  end
  resources :artists, only: %i[create update destroy] do
    scope module: :artists do
      resources :artist_bookmarks, path: :bookmarks, only: %i[create destroy]
      resources :artist_links, path: :links, only: %i[update]
    end
  end
end
