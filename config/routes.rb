Rails.application.routes.draw do
  resources :contacts
  resources :users

  post 'sessions/authenticate'
end
