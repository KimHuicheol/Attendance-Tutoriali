Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  #ログイン機能
  get    '/login' , to: 'session#new'
  post   '/login' , to: 'session#create'
  delete '/logout', to: 'session#destory'
  
  resources :users
end
