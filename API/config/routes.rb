Rails.application.routes.draw do
  # devise_for :users
  namespace :v1 do
    resources :sports
  end

  namespace :v1 do
    resources :sessions, only: [:create, :destroy]
    resources :sports, path: '', only: [:show] do
      resources :categories, path: '', except: [:index] do
        resources :leagues, path: '', except: [:index] do
          resources :teams, except: [:index] do
          end
          resources :games, except: [:index] do
          end
          get "/:year/:name", to: "seasons#show", as: "season"
        end
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
