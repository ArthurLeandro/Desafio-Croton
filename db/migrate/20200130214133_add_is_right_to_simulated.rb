class AddIsRightToSimulated < ActiveRecord::Migration[6.0]
  def change
    add_column :simulateds, :got_right, :boolean # Boolean que representa se o usuário acertou uma questão do simulado
  end
end
