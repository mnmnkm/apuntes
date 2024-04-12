Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :article_comments, only: [:create, :destroy]
  end
  
  resources :words, only: [:new, :create, :index, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :word_comments, only: [:create, :destroy]
  end
  
  resources :questions do
    resources :question_comments, only: [:create, :destroy]
    resources :question_answers, only: [:create, :destroy] do
        resource :favorites, only: [:create, :destroy]
    end
  end
  
  resources :users, only: [:show, :edit, :update] do
    member do
      # get :favorites
      # get :confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
