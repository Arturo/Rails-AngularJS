Project1::Application.routes.draw do
  root :to => 'user_registrations#new'
  resources :user_registrations, only: [:new, :create]
  get '/user/confirm/:confirmation_token', to: 'users#confirm', as: 'confirmation'
end
