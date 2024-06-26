# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'home#index'

    resources :movies do
      # BEGIN
      scope module: :movies do
        resources :reviews, except: %i[show]
        resources :comments, except: %i[show]
      end
      # END
    end

    resources :reviews, only: %i[index]
  end
end
