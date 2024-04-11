class RenameTypeInPokemons < ActiveRecord::Migration[7.1]
  def change
    rename_column :pokemons, :type, :pokemon_type
  end
end
