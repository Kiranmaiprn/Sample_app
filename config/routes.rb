Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope 'royalkitchen' do 
    resources :users, except: [:new, :edit, :create]
  end
  post 'royalkitchen/user/signup', to: 'users#signup'
  post 'royalkitchen/user/login', to: 'users#login'
end
