Friedcheckin::Application.routes.draw do
  resources :events
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  match '/students/eventslist' => 'students#studentsList', :via => :get 

  match '/students/studentslist' => 'events#eventsList', :via => :get
  resources :students 
  resources :volunteers
  
  match ':controller(/:action(/:name/:pin))'
  match ':controller(/:action(/:getStudents))'
  match ':controller(/:action(/:newStudent/:student))'
  
  root :to => redirect('/students')
end
