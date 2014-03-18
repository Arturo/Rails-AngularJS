Project1::Application.routes.draw do
  root :to => 'user_registrations#new'
  resources :user_registrations, only: [:new, :create]
  get '/:confirmation_token', to: 'users#confirm'
end
