# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  get '/:locale', to: 'home#index'
  root 'home#index'
  
  scope '/:locale' do
    resources :posts do
      resources :comments, except: %i[index show]
    end
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
