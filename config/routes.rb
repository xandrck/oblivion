Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :storages
  post "storages/new"    => "storages#new"

end
