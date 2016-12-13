Rails.application.routes.draw do

  resources :custom_fields
  root 'home#index'
  resources :contacts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
