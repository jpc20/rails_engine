Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      namespace :merchants, path: "/merchants/:id" do
        resources :items, only: [:index]
      end
    end
  end

end
