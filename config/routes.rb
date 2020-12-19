Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  root "posts#index"
  resources :zines do
    collection do
	  post '/:id/user_private' => 'zines#user_private'
    end
  end
  resources :users, only: [:edit, :update]
end
