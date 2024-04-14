# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts, shallow: true do
    scope module: :posts do
      resources :comments, except: %i[index show]
    end
  end
  # END
end
