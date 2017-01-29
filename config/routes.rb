Rails.application.routes.draw do
  root "searched_terms#home"
  resources :searched_terms
  get '/most_searched' => 'searched_terms#most_searched'

end
