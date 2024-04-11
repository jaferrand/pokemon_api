# Pokémon API

Bienvenido a la API de Pokémon, una API simple para obtener información sobre tus Pokémon favoritos. Este proyecto está construido utilizando Ruby on Rails y SQLite como base de datos.

## Requisitos

- Ruby (versión 2.7.2 o superior)
- Rails (versión 6.0.3.4 o superior)
- SQLite3

## Instalación

Para poner en marcha la API de Pokémon en tu entorno local, sigue estos pasos:

1. Clona el repositorio en tu máquina local:


cd pokemon_api
Instala las gemas necesarias:
bundle install
Crea y configura la base de datos:
rails db:create
rails db:migrate
Inicializa la base de datos con datos de Pokémon:
rails db:seed
Inicia el servidor de Rails:
rails server
Ahora deberías poder acceder a la API en http://localhost:3000.

Uso
La API proporciona los siguientes endpoints para interactuar con los datos de Pokémon:

GET /pokemons: Lista todos los Pokémon disponibles.
GET /pokemons/:id: Muestra un Pokémon específico según su ID.
POST /pokemons: Crea un nuevo Pokémon (requiere parámetros).
PATCH/PUT /pokemons/:id: Actualiza un Pokémon existente (requiere parámetros).
DELETE /pokemons/:id: Elimina un Pokémon de la base de datos.

Contacto
Si tienes alguna pregunta o comentario sobre la API de Pokémon, no dudes en contactarme a través de jferrando@gmail.com.

¡Gracias por utilizar la API de Pokémon!


