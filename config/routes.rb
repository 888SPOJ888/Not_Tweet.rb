Rails.application.routes.draw do
  resources :tweets do
    post 'like', to:"tweets#like"
    post 'retweet', to:"tweets#retweet"
  end
  devise_for :users
  root to: "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
