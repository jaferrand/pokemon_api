Rails.application.routes.draw do
  # Rutas para Pokémon
  resources :pokemons, only: [:index] do
    collection do
      get :capturados
      post :importar
    end
    member do
      patch :capturar
      patch :liberar
    end
  end

  # Ruta de estado de salud
  get "up" => "rails/health#show", as: :rails_health_check

  # Define tu ruta raíz si es necesario
  # root "some_controller#index"
end
