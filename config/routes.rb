Rails.application.routes.draw do
  get 'rakuten_look' => 'rakuten#look'
  devise_for :users,controllers: {
    registrations: 'users/registrations'
  }
  root 'homes#index'
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :boards do
    get :search, on: :collection
    resources :reviews, only: [:index, :create]
  end

end
