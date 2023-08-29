Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'weather/today', to: "pages#today"
  get 'weather/forecast', to: "pages#forecast"
  get 'dashboard', to: "pages#dashboard"

  resources :outfits
end
