Rails.application.routes.draw do
  resources :searched_terms
  root "searched_terms#home"
end
