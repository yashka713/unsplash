Rails.application.routes.draw do
  get 'photos/show'

  get 'photos/index'

  root 'photos#index'

  resource :photo do
    get 'download'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
