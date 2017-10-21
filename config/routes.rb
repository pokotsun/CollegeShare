Rails.application.routes.draw do

  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions'
}

  get 'search/index'
  root 'static_pages#start'
  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
