Rails.application.routes.draw do

  resources :categories do
    collection do
      get :payments
    end
  end

  resources :transactions do
    collection do
      get :payments
      get :incomes
    end
  end

  root 'categories#index'

end
