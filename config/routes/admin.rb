namespace :admin do
  root to: "admin#index"
  get '/second', to: "admin#second"

  resources :users, only: %i[index destroy]
end
