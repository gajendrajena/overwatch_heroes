Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :heros, only: [:index, :show]
    end
  end
end
