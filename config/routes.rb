Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :students, controllers:{
    sessions: "students/sessions",
    passwords: "students/passwords",
    registrations: "students/registrations"
  }
  resources :students, only:[:index, :show, :edit, :update, :destroy]
  resources :follows, only:[:create, :destroy]
  resources :requests do
    get "videos/request_new"
    post "videos/request_create"
  end
  resources :videos do
    resources :comments, only:[:create, :destroy]
    resources :evaluations, only:[:create, :update, :destroy]
  end
  resources :communities do
    member do
      post "add"
      delete "out"
    end
    resources :tweets, only:[:new, :create, :destroy]
  end
  resources :tweets, only:[:show] do
    resources :reply_tweets, only:[:new, :create, :destroy]
    resources :comment_evaluations, only:[:create, :destroy]
  end
  resources :comments, only:[:show] do
    resources :reply_comments, only:[:new, :create, :destroy]
    resources :comment_evaluations, only:[:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
