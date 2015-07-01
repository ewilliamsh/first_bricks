Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  namespace :api, path: "/api" do
    api_version(
      :module => "V1",
      :header => {
        :name => "Accept",
        :value => "application/vnd.hsnews.com+json; version=1"
      },
      :defaults => {
        :format => :json
      },
      :default => true
    ) do
      resources :products, only: [:index, :show, :update, :destroy, :create]
      resources :business_partners, only: [:index, :show, :destroy, :update, :create]
    end
  end
end
