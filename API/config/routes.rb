Rails.application.routes.draw do
  namespace :v1 do
    resources :sports
  end

  namespace :v1 do
    resources :sports, path: '', only: [:show] do
      resources :categories, path: '', except: [:index] do
        resources :leagues, path: '', except: [:index] do
          resources :teams, except: [:index] do
          end
          resources :games, except: [:index] do
          end
        end
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
