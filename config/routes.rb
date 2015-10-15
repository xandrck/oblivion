Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :storages
  resources :users
  resources :bookmarks
  resources :bookmarks_groups
end
