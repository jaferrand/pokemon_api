# db/seeds.rb

# Lista de Pokémon con sus atributos para crearlos
pokemons = [
  { nombre: 'Pikachu', url_imagen: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png', capturado: false, pokemon_type: 'Electric' },
  { nombre: 'Charmander', url_imagen: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', capturado: false, pokemon_type: 'Fire' },
  { nombre: 'Squirtle', url_imagen: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', capturado: false, pokemon_type: 'Water' },
  # Agrega más Pokémon aquí si lo deseas
]

# Iterar sobre la lista de Pokémon y crearlos en la base de datos
pokemons.each do |pokemon_attributes|
  Pokemon.find_or_create_by!(pokemon_attributes)
end

puts "Seeds: #{Pokemon.count} Pokémon creados."
