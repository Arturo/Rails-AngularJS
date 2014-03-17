Project1::Application.routes.draw do
  root :to => 'registrations#new'
  resources :registrations, only: [:new, :create]
  get '/:confirmation_token', to: 'users#confirm'
end
