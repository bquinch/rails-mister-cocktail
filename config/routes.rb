Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[index show create] do
    resources :doses, only: %i[create]
  end

  resources :cocktails, only: :destroy

  resources :doses, only: :destroy
end
