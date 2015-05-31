Rails.application.routes.draw do
  
  root to: 'static_pages#home'

  get 'static_pages/about' => 'static_pages#about'
  get 'static_pages/contact' => 'static_pages#contact'

  devise_for :users do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
  	get 'calc', on: :collection
  	post 'create_user', on: :collection
    put 'update', on: :collection
  end

end
