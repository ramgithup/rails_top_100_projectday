Rails.application.routes.draw do
  get 'static/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :billboard do
      resources :artists
    end
    resources :artists do
      resources :songs
    end
    end
  end
end
