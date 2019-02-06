Rails.application.routes.draw do
  # Use for login and autorize all resource
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end
  devise_for :users, controllers: {
       registrations: 'users/registrations',
   }, skip: [:sessions, :password]

  resources :todos
end


