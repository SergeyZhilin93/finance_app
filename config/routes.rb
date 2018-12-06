Rails.application.routes.draw do

  resources :category do
    collection do
      get :payments
    end
  end

  root 'category#index'

end
