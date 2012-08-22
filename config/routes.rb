Spark::Application.routes.draw do
  resources :statuses

  root :to => 'high_voltage/pages#show', :id => 'about'
end
