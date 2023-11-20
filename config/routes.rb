Rails.application.routes.draw do
  resources :students do
    collection do
      get 'search'
      get 'search_student'
    end
  resources :messages
  end
  
  root 'students#index'
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
