Rails.application.routes.draw do

  devise_for :users
  resources :volunteers do
  end
  
  resources :groups do
  end
  
  resources :kids do
    get 'register', on: :new
    collection do
      post 'confirm'
    end
  end

  root 'kids#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
