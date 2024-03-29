Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/graphql', to: 'graphql#execute'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  get '/basic_auth', to: 'basic_auth#auth'
  resource :contacts, only: :create
  resources :requests
  resources :musics
  resources :bands do
    scope module: :bands do
      resources :artist_bands, path: :artists, only: %i[create destroy]
      resources :band_albums, path: :albums, only: %i[create destroy]
      resources :band_links, path: :links, only: %i[update]
      resources :band_bookmarks, path: :bookmarks, only: %i[create destroy]
    end
  end
  resources :albums do
    scope module: :albums do
      resources :artist_albums, path: :artists, only: %i[create destroy]
      resources :album_links, path: :links, only: %i[update]
      resources :album_bookmarks, path: :bookmarks, only: %i[create destroy]
    end
  end
  resources :users do
    scope module: :users do
      resources :notifications, only: %i[update]
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
      resources :user_relationships, path: :relationships, only: %i[create destroy]
    end
  end
  resources :artists do
    scope module: :artists do
      resources :artist_bookmarks, path: :bookmarks, only: %i[create destroy]
      resources :artist_links, path: :links, only: %i[update]
    end
  end
end
