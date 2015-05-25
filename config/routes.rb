Rails.application.routes.draw do
  
  root to: 'static_pages#home'

  get 'static_pages/about' => 'static_pages#about'
  get 'static_pages/calc' => 'static_pages#calc'
  get 'static_pages/contact' => 'static_pages#contact'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
