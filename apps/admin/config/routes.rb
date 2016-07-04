get '/steads/:id', to: 'steads#destroy'
get '/steads/:id', to: 'steads#update'
get '/', to: 'settings#index', as: 'root'
resources :steads