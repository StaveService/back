Rails.application.routes.draw do
  resources :artists do
    resources :albums do
      resources :musics
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
