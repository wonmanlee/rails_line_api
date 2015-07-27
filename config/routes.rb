Rails.application.routes.draw do
  scope :api do
    namespace :v1, defaults: { format: :json } do
      get '/lines'              => 'lines#show'
    end
  end
end