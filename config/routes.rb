Friedcheckin::Application.routes.draw do
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :events
  resources :students 
  resources :volunteers
  match ':controller(/:action(/:name/:pin))'
  match ':controller(/:action(/:getStudents))'
  match ':controller(/:action(/:newStudent/:student))'
  root :to => redirect('/friedcheckin/students')
end
