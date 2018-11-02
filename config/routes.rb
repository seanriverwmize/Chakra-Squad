Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, :controllers => {:registrations => "registrations"}
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :users
  resources :products do
    resources :comments
  end
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  root 'simple_pages#index'
  post 'simple_pages/thank_you'

  post 'payments/create'
  get 'payments/payment_made'
  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
