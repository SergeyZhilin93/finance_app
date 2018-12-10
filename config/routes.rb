Rails.application.routes.draw do

  resources :categories do
    collection do
      get :payments
    end
  end

  root 'categories#index'

end
