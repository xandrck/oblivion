Rails.application.routes.draw do
  resources :storages
  devise_for :users

  root 'welcome#index'

end
