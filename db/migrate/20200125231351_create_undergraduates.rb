class CreateUndergraduates < ActiveRecord::Migration[6.0]
  def change
    create_table :undergraduates do |t|
      t.string :name # Nome do usuário que será cadastrado no banco de dados 
      t.boolean :isAble # Boolean que controla se o usuário fez ou não o simulado

      t.timestamps
    end
  end
end
