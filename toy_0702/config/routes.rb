Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  root 'home#index'
  resources :posts
  resources :products
  resources :comments
  resources :contacts
  resources :wish_lists
  resources :orders do
    collection do # id 필요없음
      get :cart
      delete :destroy
    end
    member do # id 필요함
      get :payment
      post :payment_completed
    end
  end
  resources :line_items do
    collection do # helper_method 사용 (application.controller)
      get :add_cart
      get :update_amount
    end
  end
end
