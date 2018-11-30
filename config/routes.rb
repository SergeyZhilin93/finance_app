Rails.application.routes.draw do

  resources :category do
    collection do
      get :settings
    end
  end

  root 'category#settings'

end
