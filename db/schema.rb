# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_30_214133) do

  create_table "enunciateds", force: :cascade do |t|
    t.text "question"
    t.text "alternatives"
    t.text "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "simulateds", force: :cascade do |t|
    t.string "question" # Questão do simulado que será renderizada
    t.text "alternatives" # Todas as alternativas da questão, as alternativas no momento precisam de ter um ';' para serem "splitadas"
    t.integer "correct_alternative" # Número que representa a questão correta, esse valor tem que estar entre 0 e 3 
    t.integer "amount_taken" # Número que representa quantas vezes o simulado foi feito
    t.integer "amount_correct_answers" # Número que representa quantas vezes o simulado foi acertado
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "correct_value" # Número que representa o valor que o usuário marcou na resposta 
    t.boolean "got_right" # Boolean que representa se o usuário acertou uma questão do simulado
  end

  create_table "students", force: :cascade do |t|
    t.string "name" # Nome do usuário que será cadastrado no banco de dados
    t.boolean "isAble" # Boolean que controla se o usuário fez ou não o simulado
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "undergraduates", force: :cascade do |t|
    t.string "name"
    t.boolean "isAble"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
