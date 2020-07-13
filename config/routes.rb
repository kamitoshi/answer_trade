Rails.application.routes.draw do
  get 'videos/index'
  get 'videos/show'
  get 'videos/new'
  get 'videos/edit'
  root 'home#top'
  get 'home/about'
  devise_for :students, controllers:{
    sessions: "students/sessions",
    passwords: "students/passwords",
    registrations: "students/registrations"
  }
  resources :students, only:[:index, :show, :edit, :update, :destroy]
  resources :requests do
    get "videos/request_new"
    post "videos/request_create"
  end
  resources :videos
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
