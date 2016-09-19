Rails.application.routes.draw do
  root to: "devices#index"
  resources :devices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
