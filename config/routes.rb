require "sidekiq/web"
require 'sidekiq/cron/web'

class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do

  mount External::API          => "/"

  draw :admin
  # root to: 'home#index'

  devise_scope :user do
    get '/', to: 'devise/sessions#new'
  end
  devise_for :users, controllers: {
    confirmations: 'user/confirmations'
  }

  resources :pugs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  constraints AccessConstraint do
    mount GrapeSwaggerRails::Engine => '/swagger'
    mount Sidekiq::Web => "/sidekiq"
    mount Flipper::UI.app(Flipper) => '/flipper'
  end
end
