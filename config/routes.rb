Bridgetroll::Application.routes.draw do
  root :to => "events#index"

  devise_for :users

  resources :users do
    resource :profile, :only => [:edit, :update, :show]
  end

  resources :locations

  resources :events do
    resources :organizers, :only => [:index, :create, :destroy]
    resources :event_sessions, :only => [] do
      resources :checkins, :only => [:index, :create, :destroy]
    end
  end

  resources :rsvps, :except => :index
end
