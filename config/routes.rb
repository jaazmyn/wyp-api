# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, only: []

  namespace :v1, defaults: { format: :json } do
    get 'plants/index'
    resource :login, only: :create, controller: :sessions
  end
end