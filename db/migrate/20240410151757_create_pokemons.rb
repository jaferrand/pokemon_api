class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :nombre, null: false, index: { unique: true }
      t.string :tipo, null: false
      t.string :url_imagen
      t.boolean :capturado, default: false #cuando se crea un nuevo Pokémon, inicialmente no está capturado.
      t.timestamps
    end
    add_index :pokemons, :tipo
  end
end
