Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "schedule#index"

  resources :check_ins, only: [:update]

  resources :prescriptions, only: [:index, :new, :create] do
    get 'check_schedule', to: "prescriptions#check_schedule"
  end
end
