class AddCorrectValueToSimulated < ActiveRecord::Migration[6.0]
  def change
    add_column :simulateds, :correct_value, :integer # Número que representa o valor que o usuário marcou na resposta 
  end
end
