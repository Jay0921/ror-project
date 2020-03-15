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
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }
  resources :pugs
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  constraints AccessConstraint do
    mount GrapeSwaggerRails::Engine => '/swagger'
    mount Sidekiq::Web => "/sidekiq"
    mount Flipper::UI.app(Flipper) => '/flipper'
  end
end
