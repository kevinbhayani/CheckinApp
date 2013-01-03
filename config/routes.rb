Friedcheckin::Application.routes.draw do
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  match '/users' => 'users#index', :via => :get 
  match '/students/eventslist' => 'students#studentsList', :via => :get 
  match '/events/studentslist' => 'events#eventsList', :via => :get
  match '/checkin/addstudent' => 'checkin#addStudent', :via => :post 

  match "/auth/:provider/callback" => "sessions#create"

  resources :students 
  resources :events
  resources :volunteers
  resources :checkin
  
  match ':controller(/:action(/:name/:pin))'
  match ':controller(/:action(/:getStudents))'
  match ':controller(/:action(/:newStudent/:student))'
  root :to => redirect('/students')
end
