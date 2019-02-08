Rails.application.routes.draw do
  # Use for login and autorize all resource
  use_doorkeeper do
    # No need to register client application
    controllers :tokens => 'doorkeeper/access_token'
    skip_controllers :applications, :authorized_applications

  end
  devise_for :users, controllers: {
       registrations: 'users/registrations',
       passwords: "users/passwords"
   }, skip: [:sessions]

  resources :todos do
    collection do
      get :personal_list
      get :collaborative_list
    end
  end
end


