Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'students/edit'
  root 'home#top'
  get 'home/about'
  devise_for :students, controllers:{
    sessions: "students/sessions",
    passwords: "students/passwords",
    registrations: "students/registrations"
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
