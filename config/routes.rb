Rails.application.routes.draw do

  resources :kids do
    get 'register', on: :new
    member do
      get 'confirm'
    end
  end

  root 'kids#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
