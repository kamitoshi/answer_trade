Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :students, controllers:{
    sessions: "students/sessions",
    passwords: "students/passwords",
    registrations: "students/registrations"
  }
  resources :students, only:[:index, :show, :edit, :update, :destroy]
  resources :requests
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
