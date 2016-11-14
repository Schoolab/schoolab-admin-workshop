Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }

  # get 'events/today' => 'events#today'

  resources :events

  resources :companies

  resources :floors

  resources :residents, only: [:index, :new, :create, :update, :destroy]

  match 'residents/make_admin/:id' => 'residents#make_admin', via: :patch, as: 'make_admin'
  match 'residents/make_user/:id' => 'residents#make_user', via: :patch, as: 'make_user'

  namespace :api, defaults: {format: :json} do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      scope :events do
        get '/' => 'events#index'
        get 'today' => 'events#today'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
