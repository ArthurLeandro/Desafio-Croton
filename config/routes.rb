Rails.application.routes.draw do
  root to: "homepage#home"
  resources :simulated
  resources :undergraduates
end
