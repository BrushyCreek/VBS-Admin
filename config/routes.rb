Rails.application.routes.draw do

  devise_for :users, skip: [:registrations],
             controller: {
               sessions: 'users/sessions',
               passwords: 'users/passwords',
               registrations: 'users/registrations'
             }
  # Recreates the Devise registrations routes
  # They act on a singular user (the signed in user)
  # Add the actions you want in 'only:'
    resource :users,
             only: [:edit, :update, :destroy],
             controller: 'devise/registrations',
             as: :user_registration do
      get 'cancel'
    end

    authenticated :user do   
      # Seting up admin scope for :users
      # so as to not conflict with the routes from devise.
      # These routes should give users with the admin role
      # the abbility to edit info for all other users.
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
      
      root to: 'kids#index', as: :authenticated_root
    end
  

    root to: redirect('users/sign_in')
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
