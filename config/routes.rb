Rails.application.routes.draw do
  
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  
  devise_for :users
  root "documents#index"
  
  
  

 
  # namespace :documents do
  #   resources :searches, only: [:index]
  # end

  resources :documents, only: [:index, :create, :edit, :destroy, :update, :show] do
    collection do
      get 'search', to: 'documents#search'
    end
  end

  resources :documents, shallow: true do
    resource :bookmarks, only: %i[create destroy]
    get :bookmarks, on: :collection
  end

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
