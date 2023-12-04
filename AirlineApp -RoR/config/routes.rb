Rails.application.routes.draw do
  root 'airports#index'
  get '/airports' => 'airports#index', as: :airports
  get '/planes' => 'planes#index', as: :planes
  get '/planes/new' => 'planes#new'
  get '/pilots' => 'pilots#index', as: :pilots
  post '/planes' => 'planes#create', as: :post_plane
  get '/planes/:id/destroy' => 'planes#destroy', as: :destroy_plane
  get '/plane/:id' => 'planes#show'
  get '/baggages' => 'baggages#index', as: :baggages
  get '/baggage/:id' => 'baggages#new'
  get '/baggages/:id/edit' => 'baggages#edit', as: :edit_baggage
  patch '/baggages/:id' => 'baggages#update'
  post '/baggage/:id' => 'baggages#create', as: :create_baggage
  get '/baggages/:id/destroy' => 'baggages#destroy', as: :destroy_baggage
end
