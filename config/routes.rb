YoganowApi::Application.routes.draw do

  mount RailsAdmin::Engine => '/console', :as => 'rails_admin'

  devise_for :admins
  namespace :api do
    resources :yoga_studios do 
      get :nearby, on: :collection
      resources :yoga_classes
    end
    get 'yoga_classes/nearby', to: 'yoga_classes#nearby'
  end

end
