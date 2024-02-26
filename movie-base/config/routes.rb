Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    resources :users
  end
  Rails.application.routes.draw do
    resources :films do
      resources :cast, only: [:index], controller: 'film_casts' # film/id/cast will give the movie cast
    end
  end
  Rails.application.routes.draw do
    resources :sources
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
