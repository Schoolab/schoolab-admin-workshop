Rails.application.routes.draw do

  get '/.well-known/acme-challenge/:id' => 'home#letsencrypt'

  root to: "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :events do
    get 'deleted' => "events#deleted", on: :collection
    get 'past' => "events#past", on: :collection
    get 'future' => "events#future", on: :collection
    match 'recover', to: 'events#recover', on: :member, via: [:put, :patch]
  end

  resources :companies do
    get 'deleted' => 'companies#deleted', on: :collection
    match 'recover', to: 'companies#recover', on: :member, via: [:put, :patch]
  end

  resources :programs do
    get 'deleted' => 'programs#deleted', on: :collection
    match 'recover', to: 'programs#recover', on: :member, via: [:put, :patch]
  end

  resources :projects do
    get 'deleted' => 'projects#deleted', on: :collection
    match 'recover', to: 'projects#recover', on: :member, via: [:put, :patch]
    resources :members, only: [:create], controller: :project_members
    resources :logs, only: [:index, :create, :destroy], controller: :logs
  end

  resources :roles, only: [:destroy]

  resources :floors do
    get 'deleted' => 'floors#deleted', on: :collection
    match 'recover', to: 'floors#recover', on: :member, via: [:put, :patch]
  end

  resources :meeting_rooms do
    get 'deleted' => 'meeting_rooms#deleted', on: :collection
    match 'recover', to: 'meeting_rooms#recover', on: :member, via: [:put, :patch]
  end

  resources :reservations, except: [:show] do
    get 'past' => "reservations#past", on: :collection
    get 'deleted' => "reservations#deleted", on: :collection
    match 'recover', to: 'reservations#recover', on: :member, via: [:put, :patch]
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
        get 'last' => 'residents#last'
      end
      scope :companies do
        get '/' => 'companies#index'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
