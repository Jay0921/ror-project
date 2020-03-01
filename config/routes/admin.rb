namespace :admin do
  root to: "admin#index"
  get '/second', to: "admin#second"
end
