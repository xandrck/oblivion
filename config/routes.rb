Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :storages
  resources :users
  resources :bookmarks
  resources :bookmarks_groups

  get 'new_upload' => 'bookmarks_groups#new_upload'
  post 'upload' => 'bookmarks_groups#upload'
end
