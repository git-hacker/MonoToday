# == Route Map
#
#              Prefix Verb URI Pattern                    Controller#Action
#                root GET  /                              website#index
#         quick_tasks GET  /tasks/quick(.:format)         tasks#quick
# grass_catcher_tasks GET  /tasks/grass-catcher(.:format) tasks#grass_catcher
#       complete_task POST /tasks/:id/complete(.:format)  tasks#complete
#               tasks POST /tasks(.:format)               tasks#create
# 

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#index'

  resources :tasks, only: [:create] do
    collection do
      get 'quick'
      get 'grass-catcher'
      get 'completed'
    end
    member do
      post 'complete'
    end
  end
end
