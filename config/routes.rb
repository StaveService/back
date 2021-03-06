Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users
  resources :albums
  resources :musics
  resources :artists do
    resources :musics, controller: "artists/musics"
    resources :albums, controller: "artists/albums" do
      resources :musics, controller: "artists/albums/musics"
    end
  end
end
