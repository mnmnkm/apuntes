Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  
  resources :articles, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :article_comments, only: [:create, :destroy]
  end
  
  resources :words, only: [:new, :create, :index, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :article_comments, only: [:create, :destroy]
  end
  
  resources :questions, only: [:new, :create, :index, :show, :destroy] do
    resources :article_comments, only: [:create, :destroy]
    resources :article_answers, only: [:create, :destroy] do
        resource :favorites, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
