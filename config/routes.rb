Rails.application.routes.draw do

  devise_for :users, skip: [:registrations],
             controller: {
               sessions: 'users/sessions',
               passwords: 'users/passwords',
               registrations: 'users/registrations'
             }

 # seting up admin scope for :users so as to not conflict with the routes from devise
 scope "/admin" do
   resources :users do
   end
 end
  
               
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
