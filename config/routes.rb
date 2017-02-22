Rails.application.routes.draw do

  get '/.well-known/acme-challenge/:id' => 'home#letsencrypt'

  root to: "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :events do
    get 'past' => "events#past", on: :collection
  end

  resources :companies

  resources :floors

  resources :meeting_rooms

  resources :reservations, except: [:show] do
    get 'search' => "reservations#search", on: :collection
  end

  resources :residents, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  namespace :api, defaults: {format: :json} do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      scope :events do
        get '/' => 'events#index'
        get 'today' => 'events#today'
        get 'public' => 'events#public'
      end
      scope :residents do
        get '/' => 'residents#index'
      end
      scope :companies do
        get '/' => 'companies#index'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
