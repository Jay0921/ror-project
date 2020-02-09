namespace :admin do
  root to: "admin#index"
  get '/second', to: "admin#second"

  resources :users, only: %i[index destroy]
  resources :rake_tasks, only: [:index, :show] do
    collection do
      post :run
    end
  end
  resources :home
  resources :products, except: [:show]
  resources :catalogues, except: [:show]
  resources :categories, except: [:show]
  resources :memberships, except: [:show]
  resources :catalogue_products, only: [:show]
end
