Friedcheckin::Application.routes.draw do
  resources :students 
  resources :volunteers
  root :to => redirect('/students')
end
