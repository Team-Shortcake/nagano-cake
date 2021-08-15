Rails.application.routes.draw do
  
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  get 'customers/show'
  devise_for :admins, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions',
    :passwords => 'admin/passwords'
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
    delete '/public/cart_items' => 'destroy_all'
    resources :orders, only:[:index,:show,:new,:create]
    resources :customers, only:[:show,:edit,:update,:destroy]
    get '/public/customers/quit_confirmation' => 'quit_confirmation'
    patch '/public/customers/quit' => 'quit'
    resources :items, only:[:index,:show]
  end
  
end
