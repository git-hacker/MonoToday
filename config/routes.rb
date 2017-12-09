# == Route Map
#
#      Prefix Verb URI Pattern            Controller#Action
#        root GET  /                      website#index
# quick_tasks GET  /tasks/quick(.:format) tasks#quick
#       tasks POST /tasks(.:format)       tasks#create
# 

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#index'

  resources :tasks, only: [:create] do
    collection do
      get 'quick'
      get 'grass-catcher'
    end
  end
end
