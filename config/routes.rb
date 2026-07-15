Rails.application.routes.draw do
  root "pages#home"
  get "about"   => "pages#about",   as: :about
  get "contact" => "pages#contact", as: :contact

  resources :projects, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check

  # Silence favicon.ico requests (no content) until a real favicon is added
  get "favicon.ico", to: proc { [204, {}, []] }
end
