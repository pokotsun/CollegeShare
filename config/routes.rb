Rails.application.routes.draw do

  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions'
}
  #
  # as :users do
  #   get '/login', to: 'users/sessions#new'
  #   post '/login', to: 'users/sessions#create'
  #
  #   delete '/logout', to: 'users/sessions#destroy'
  # end

  root 'static_pages#start'
  get 'static_pages/home'

  resources :search


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
