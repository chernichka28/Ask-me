Rails.application.routes.draw do
  resources :questions
  put '/questions/:id/hide', to: 'questions#hide'
end