Rails.application.routes.draw do

  get 'weather/forecast', to: "pages#forecast"
  get 'dashboard', to: "pages#dashboard"

  resources :outfits

  devise_for :users
  unauthenticated do
    devise_scope :user do
      root "pages#home", as: :unauthenticated_root
    end
  end
  authenticated :user do
    root to: "home#index", as: :root
  end
end
