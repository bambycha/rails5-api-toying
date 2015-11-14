Rails.application.routes.draw do
  get '/', to: 'v1/root#index'
end
