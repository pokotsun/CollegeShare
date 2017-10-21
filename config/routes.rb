Rails.application.routes.draw do

  get 'topics/index'

  get 'topics/show'

  get 'topics/create'

  get 'search/index'
  root 'static_pages#start'
  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
