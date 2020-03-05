namespace :admin do
  root to: "admin#index"
  get '/second', to: "admin#second"

  resources :users, only: %i[index destroy]
  resources :rake_tasks, only: [:index, :show] do
    collection do
      post :run
    end
  end
end
