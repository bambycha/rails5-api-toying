Rails.application.routes.draw do
  namespace 'v1' do
    resources :suppliers, only: [:index]
  end

  get '/', to: 'root#index'
end
