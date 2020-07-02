Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/signin', to: 'authentication#authenticate'
  post 'auth/signup', to: 'registration#create'
end
