Rails.application.routes.draw do
  
  devise_for :users
  root "documents#index"
  resources :documents, only: [:index, :create, :edit, :destroy, :update]
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
