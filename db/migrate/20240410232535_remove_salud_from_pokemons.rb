class RemoveSaludFromPokemons < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :salud, :integer
  end
end
