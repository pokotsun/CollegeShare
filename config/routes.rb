Rails.application.routes.draw do

  get 'topics/index'
  get 'topics/show'
  get 'topics/create'

  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
}

  root 'static_pages#start'
  get 'static_pages/home'

  resources :search


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
