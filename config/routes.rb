Friedcheckin::Application.routes.draw do
  resources :students 
  resources :volunteers
  match ':controller(/:action(/:name/:pin))'
  root :to => redirect('/students')
end
