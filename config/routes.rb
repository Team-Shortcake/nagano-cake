Rails.application.routes.draw do
  
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  get 'customers/show'

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
    resources :items, only:[:index,:show,:edit,:create,:updete] 
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:create,:update]
    resources :orders, only:[:index,:show,:edit,:update]
    resources :order_items, only:[:update]
  end


  scope module: :public do

    resources :items, only:[:index,:show]
    resources :cart_items, only:[:index,:edit,:update,:destroy]
    delete '/public/cart_items' => 'cart_items#destroy_all'
    resources :orders, only:[:index,:show,:new,:create]
    get '/orders/thanks' => 'orders#thanks'
    resources :customers, only:[:show,:edit,:update,:destroy]
    get '/pubulic/customers/quit_confirmation' => 'customers#quit_confirmation'
    patch '/pubilic/customers/quit' => 'customers#quit'
    resources :addresses, only:[:index,:edit,]
  end
  
end
