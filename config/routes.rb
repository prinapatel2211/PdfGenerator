Rails.application.routes.draw do
  post 'users/create', to: 'users#create'
  get 'users/new', to: 'users#new'
  get 'users/:id/show', to: 'users#show', as: 'user_show'
  get 'users/:id/edit', to: 'users#edit', as: 'user_edit'
  patch 'users/update', to: 'users#update', as: 'user_update'
  delete 'users/:id/delete', to: 'users#destroy', as: 'user_destroy'
  get 'remove_avatar', to: 'users#remove_avatar', as: 'user_remove_avatar'
  get 'remove_logo', to: 'users#remove_logo', as: 'user_remove_logo'
  patch 'change_theme_color', to: 'users#change_theme_color', as: 'change_theme_color'
  root 'users#index'
  get 'users/:id/pdf_generate', to: 'users#pdf_generate', as: 'user_pdf_generate'
  devise_for :users
end
