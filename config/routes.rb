Stamprr::Application.routes.draw do

  root :to => 'pages#sign_in_page'
  match [PROPRIETARY :)] => 'sessions#create'
  match '/sign_out' => 'sessions#destroy', :as => :sign_out
  match '/fail' => 'pages#fail'
  get 'tags/:tag', to: 'posts#index', as: :tag

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :posts,  :only => [:index, :show, :edit, :update]
  match '/posts' => 'brands#index'
  resources :brands, :only => [:index]

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :posts
    end
  end


end
