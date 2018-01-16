Rails.application.routes.draw do
  devise_for :users, controllers: {}, skip: [:sessions, :registrations, :passwords]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sports, except: [:edit, :new]
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :retos, except: [:edit, :new]
      resources :sports, path: '', only: [:show] do
        resources :categories, path: '', except: [:index, :edit, :new] do
          resources :leagues, path: '', except: [:index, :edit, :new] do
            resources :teams, except: [:index, :edit, :new] do
            end
            resources :games, except: [:index, :edit, :new] do
            end
            get "/:year/:name", to: "seasons#show", as: "season"
          end
        end
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
