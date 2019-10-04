Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "phone_numbers#index"
  resources :phone_numbers do
  	collection do
  		get :genrate_numbers
  		post :assign_a_requested_number
  		get :assign_a_number
  	end
  end
end
