# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_23_133935) do
  create_table "administradors", force: :cascade do |t|
    t.string "nome_completo"
    t.date "data_de_nascimento"
    t.string "email"
    t.string "telefone"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome_completo"
    t.date "data_de_nascimento"
    t.string "cpf"
    t.string "email"
    t.string "telefone"
    t.string "logradouro"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "cep"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contratos", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.integer "servico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_contratos_on_cliente_id"
    t.index ["servico_id"], name: "index_contratos_on_servico_id"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.date "data"
    t.time "horario_inicio"
    t.time "horario_temino"
    t.string "preco"
    t.integer "trabalhador_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trabalhador_id"], name: "index_servicos_on_trabalhador_id"
  end

  create_table "trabalhadors", force: :cascade do |t|
    t.string "nome_completo"
    t.date "data_de_nascimento"
    t.string "email"
    t.string "telefone"
    t.string "profissao"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contratos", "clientes"
  add_foreign_key "contratos", "servicos"
  add_foreign_key "servicos", "trabalhadors"
end
