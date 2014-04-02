Project1::Application.routes.draw do
  namespace :api do
    resources :events
  end

  root :to => 'user_registrations#new'
  get '/templates/:page' => 'templates#show'

  resources :user_registrations, only: [:new, :create]
  get '/user/confirm/:confirmation_token', to: 'users#confirm', as: 'confirmation'
end
