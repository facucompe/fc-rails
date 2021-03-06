Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :book_suggestions, only: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json })   do
    resources :users do
      resources :rents, only: [:create, :index]
      collection do
        resources :sessions, only: [:create] do
          collection do
            post :renew
            post :invalidate_all
          end
        end
      end
    end
    resources :books, only: [:show, :index]
    resources :book_suggestions, only: [:create]
  end
end
