class AddTypeToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :type, :string
  end
end
