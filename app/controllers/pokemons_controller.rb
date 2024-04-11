class PokemonsController < ApplicationController
  # Método index para listar todos los pokémon de la base de datos y devolverlos como una respuesta JSON
  def index
    # Filtrado por nombre o tipo
    if params[:nombre]
      pokemons = Pokemon.where('nombre LIKE ?', "%#{params[:nombre]}%")
    elsif params[:tipo]
      pokemons = Pokemon.where('tipo LIKE ?', "%#{params[:tipo]}%")
    else
      pokemons = Pokemon.all
    end
  
    # Paginación
    pokemons = pokemons.page(params[:pagina]).per(20)
  
    # Información adicional para la respuesta
    total_pokemons = pokemons.total_count
    total_paginas = pokemons.total_pages
    pagina_actual = pokemons.current_page
  
    render json: {
      pokemons: pokemons,
      pagina: pagina_actual,
      total_paginas: total_paginas,
      total_pokemons: total_pokemons
    }
  end
  

  # Método capturar para cambiar el estado de un pokémon a capturado
  def capturar
    pokemon = Pokemon.find_by(id: params[:id])
    if pokemon
      pokemons_capturados = Pokemon.where(capturado: true)
      if pokemons_capturados.count < 6
        pokemon.update(capturado: true)
        render json: pokemon
      else
        # Cambiar el estado del pokémon más antiguo capturado a no capturado
        pokemon_mas_antiguo = pokemons_capturados.order(:updated_at).first
        pokemon_mas_antiguo.update(capturado: false)
        pokemon.update(capturado: true)
        render json: pokemon
      end
    else
      render json: { error: 'Pokémon no encontrado' }, status: :not_found
    end
  end
  

  # Método capturados para listar todos los pokémon que han sido capturados
  def capturados
    pokemons_capturados = Pokemon.where(capturado: true)
    render json: pokemons_capturados
  end

  # Método liberar para cambiar el estado de un pokémon de capturado a no capturado
  def liberar
    pokemon = Pokemon.find_by(id: params[:id])
    if pokemon&.update(capturado: false)
      render json: pokemon
    else
      render json: { error: 'Pokémon no encontrado o no se pudo liberar' }, status: :not_found
    end
  end

  # Método importar para importar los primeros 150 pokémon a la base de datos desde alguna fuente externa
  def importar
 response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=150')

    if response.success?
      pokemons_data = response.parsed_response['results']
      pokemons_to_insert = []

      pokemons_data.each do |pokemon_data|
        pokemon_name = pokemon_data['name']
        pokemon_url = pokemon_data['url']

        pokemon_response = HTTParty.get(pokemon_url)
        pokemon_info = pokemon_response.parsed_response

        types = pokemon_info['types'].map { |type| type['type']['name'] }

        pokemon_hash = {
          nombre: pokemon_name.capitalize,
          tipo: types.join(', '),
          url_imagen: pokemon_info['sprites']['front_default'],
          capturado: false
        }

        pokemons_to_insert << pokemon_hash
      end

      Pokemon.import pokemons_to_insert, on_duplicate_key_update: { conflict_target: [:nombre], columns: [:tipo, :url_imagen, :capturado] }

      render json: { message: 'Pokémon importados exitosamente' }
    else
      render json: { error: 'Error al importar los pokémon' }, status: :unprocessable_entity
    end
  end
end


