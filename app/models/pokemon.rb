class Pokemon < ApplicationRecord
  # Validaciones
  # Asegura que el nombre esté presente y sea único, ignorando mayúsculas y minúsculas.
  validates :nombre, presence: true, uniqueness: { case_sensitive: false }
  
  # Asegura que el tipo esté presente.
  validates :pokemon_type, presence: true
  

end

