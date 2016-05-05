Rails.application.routes.draw do
  resources :todo_lists do
    resource :todo_items do
      member do
        patch :complete
      end
    end
  end
  root "todo_lists#index"

end
