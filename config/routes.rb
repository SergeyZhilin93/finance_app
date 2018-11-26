Rails.application.routes.draw do
  get 'category/settings'

  resources :category

  root 'category#settings'

end
