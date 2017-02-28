Rails.application.routes.draw do
  get 'notifications/link_through'

  get 'profiles/show'

  devise_for :users, :controllers => {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles do
    resources :comments
    member do
      get 'like'
    end
  end
  get ':first_name', to: 'profiles#show', as: :profile
  get ':first_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'
end
