Rails.application.routes.draw do

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions',
    :passwords => 'admins/passwords'
  }

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions',
    :passwords => 'customers/passwords'
  }
    root 'homes#top'
    get 'about' => 'homes#about'

  namespace :admin do
    resources :items, only:[:index,:show,:new,:edit,:create,:update]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:create,:update]
    resources :orders, only:[:index,:show,:edit,:update]
    resources :order_details, only:[:update]
  end


  scope module: :public do

    resources :items, only:[:index,:show] do
      get :search, on: :collection # ジャンル検索機能用
    end
    resources :cart_items, only:[:index,:create,:update,:destroy] do
      delete '/cart_items' => 'cart_items#destroy_all', as: 'destroy_all'

    end

    post '/orders/session' => 'orders#session_create'
    get '/orders/confirm' => 'orders#confirm'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    resources :orders, only:[:new,:create,:index, :show]

    get '/customers/quit_confirmation' => 'customers#quit_confirmation'
    patch '/customers/quit' => 'customers#quit'
    resources :customers, only:[:show,:edit,:update,:destroy]
    resources :delivery_addresses, only:[:index, :edit, :destroy, :create, :update]
  end

end

