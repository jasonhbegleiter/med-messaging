Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "schedule#index"

  resources :check_ins, only: [:update]

  post 'inbound_sms', to: 'inbound_sms#create'

  resources :prescriptions, only: [:index, :new, :create] do
    resources :prescription_schedules, only: [:create]

    get 'check_schedule', to: "prescriptions#check_schedule"
  end
end
