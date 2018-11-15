Rails.application.routes.draw do
  concern :toggle do
    post 'toggle', on: :member
  end

  concern :check do
    post 'check', on: :collection
  end

  resources :artists, only: %i[update destroy]

  scope '(:locale)', constraints: { locale: /ru|en/ } do
    root 'index#index'

    resources :artists, except: %i[update destroy], concerns: :check

    namespace :admin do
      resources :artists, only: %i[index show], concerns: :toggle
    end
  end
end
