BlogApp::Application.routes.draw do

	devise_for :users
	resources :users
	resources :blogs do 
		resources :posts
	end
	resources :posts do
		resources :comments
	end
	resources :comments

	root :to => 'static_pages#home'
	match '/about',   to: 'static_pages#about'
	match '/contact', to: 'static_pages#contact'

end
