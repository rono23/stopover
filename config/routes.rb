Stopover::Engine.routes.draw do
  get '/', to: 'pages#index', as: :index
  get '*id', to: 'pages#show', as: :show
end
