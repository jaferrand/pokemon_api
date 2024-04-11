class RemoveTipoFromPokemons < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :tipo, :string
  end
end
