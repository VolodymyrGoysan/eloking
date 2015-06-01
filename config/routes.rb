Rails.application.routes.draw do
  
  root to: 'static_pages#home'

  post 'message_sent' => 'static_pages#question_sent'
  get 'static_pages/contact' => 'static_pages#contact'

  devise_for :users, controllers: {registrations: 'users/registrations', 
    sessions: 'users/sessions'}

  resources :users do
  	get 'calc', on: :collection
  	post 'create_user', on: :collection
    put 'update', on: :collection
  end

end
