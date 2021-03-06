Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets do
    post 'like', to:"tweets#like"
    post 'retweet', to:"tweets#retweet"
  end
  devise_for :users
 
  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  root to: "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api' do
    get '/news', to: 'api#news'
    get '/:date1/:date2', to: 'api#:date1/:date2' 
    post '/tweets', to: 'api#create_tweet'
  end



end

