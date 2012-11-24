Friedcheckin::Application.routes.draw do

  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  match '/students/eventslist' => 'students#studentsList', :via => :get 

  match '/events/studentslist' => 'events#eventsList', :via => :get
  resources :students 
  resources :events
  resources :volunteers
  
  match ':controller(/:action(/:name/:pin))'
  match ':controller(/:action(/:getStudents))'
  match ':controller(/:action(/:newStudent/:student))'
  
  root :to => redirect('/students')
end
