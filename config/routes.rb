BlogApp::Application.routes.draw do
  devise_for :users
	resources :users

	root :to => 'static_pages#home'
	match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
