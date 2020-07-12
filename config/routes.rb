Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants, path: '/merchants/:id' do
        resources :items, only: [:index]
      end
      namespace :items, path: '/items/:id' do
        get '/merchant', to: 'merchants#show'
      end
      get '/merchants/find', to: 'merchants/search#show'
      get '/merchants/find_all', to: 'merchants/search#index'
      get '/items/find', to: 'items/search#show'
      resources :merchants, except: [:new, :edit]
      resources :items, except: [:new, :edit]
    end
  end

end
