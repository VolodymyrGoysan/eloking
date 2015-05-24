Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile', as: 'user_root'

end
