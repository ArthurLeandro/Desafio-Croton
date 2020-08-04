class CreateSimulateds < ActiveRecord::Migration[6.0]
  def change
    # Caso eu precise de expandir essa tabela eu deveria que ser transformar os campos em arrays 
    create_table :simulateds do |t|
      t.string :question # Questão do simulado que será renderizada
      t.text :alternatives # Todas as alternativas da questão, as alternativas no momento precisam de ter um ';' para serem "splitadas"
      t.integer :correct_alternative # Número que representa a questão correta, esse valor tem que estar entre 0 e 3 
      t.integer :amount_taken # Número que representa quantas vezes o simulado foi feito
      t.integer :amount_correct_answers # Número que representa quantas vezes o simulado foi acertado

      

      t.timestamps
    end
  end
end
