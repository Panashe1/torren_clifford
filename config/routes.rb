Rails.application.routes.draw do
  root "pages#home"
  get "about"   => "pages#about",   as: :about
  get "contact" => "pages#contact", as: :contact

  resources :projects, only: [:index, :show]

  get "travel/:category" => "pages#travel", as: :travel

  get "up" => "rails/health#show", as: :rails_health_check
end
