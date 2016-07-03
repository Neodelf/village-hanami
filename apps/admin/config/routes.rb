get '/steads/:id', to: 'steads#destroy'
get '/steads/:id', to: 'steads#update'
get '/settings', to: 'settings#index', as: 'root'
resources :steads