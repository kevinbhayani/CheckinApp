Friedcheckin::Application.routes.draw do
  resources :students 
  resources :volunteers
  match ':controller(/:action(/:name/:pin))'
  match ':controller(/:action(/:getStudents))'
  match ':controller(/:action(/:newStudent/:student))'
  root :to => redirect('/students')
end
