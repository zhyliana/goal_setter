GoalSetterApp::Application.routes.draw do

  resources :users do
    resources :goals, except: [:index, :edit, :update]
  end

  resources :goals, only: [:index]

  get '/goals/:id/completed', to: 'goals#completed', as: 'completed_goal'

  resources :goals, only: [ :edit, :update]

  resources :comments

  resource :session

end
