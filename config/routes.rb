BlogApp::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :users do
    resources :blogs
    member do
      get :subscribed_blogs
    end
  end

  resources :blogs do 
    resources :posts
    member do
      get :subscribers
    end
    get 'toggle_comments', on: :member
  end

  resources :posts do
    resources :comments
    get 'toggle_comments', on: :member
  end

  resources :comments
  resources :subscriptions, :only => [:create, :destroy]
  match '/subscriptions/create', to: 'subscriptions#create'
  match '/subscriptions/destroy', to: 'subscriptions#destroy'

  root :to => 'static_pages#home'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
