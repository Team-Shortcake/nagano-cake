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
    resources :items, only:[:index,:show,:new,:edit,:create,:updete]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:create,:update]
    resources :orders, only:[:index,:show,:edit,:update]
    resources :order_details, only:[:update]
  end


  scope module: :public do

    resources :items, only:[:index,:show]
    resources :cart_items, only:[:index,:edit,:update,:destroy]
    delete '/cart_items' => 'cart_items#destroy_all'
    resources :orders, only:[:index, :show]
    # 必要なら、したのオーダーネスト
    post '/orders/session' => 'orders#session_create'
    get '/orders/confirm' => 'orders#confirm'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'

    resources :customers, only:[:show,:edit,:update,:destroy]
    get '/customers/quit_confirmation' => 'customers#quit_confirmation'
    patch '/customers/quit' => 'customers#quit'
    resources :addresses, only:[:index, :edit, :create, :destroy, :update]
  end

end
