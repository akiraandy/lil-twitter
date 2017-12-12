Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"

  get 'all_tweets', to: 'tweets#all'

  resources :tweets do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
