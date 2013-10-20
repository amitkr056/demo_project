Ustr::Application.routes.draw do

  resources :user_sessions

  resources :admins do
    member do
      get "dashboard"
    end
    resources :user_managements, :only => [:index, :create]
    resources :project_managements
    resources :requirement_managements
  end

  resources :testers do
    member do
      get "dashboard"
    end
  end
  resources :test_leaders do
    member do
      get "dashboard"
    end
    resources :project_managements
    resources :requirement_managements
  end

  resources :requirement_leaders do
    member do
      get "dashboard"
    end
    resources :requirement_managements
  end
  
  
  root :to => 'user_sessions#new'
    
  match "login" => "user_sessions#new"
  match "logout" => "user_sessions#destroy"

  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
