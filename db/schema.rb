# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160824000431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anexos", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "empresa_id"
    t.string   "descricao"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "cidade"
    t.string   "uf"
    t.string   "razaoSocial"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "imovels", force: :cascade do |t|
    t.string   "logradouro"
    t.string   "cep"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "matricula"
    t.string   "cri"
    t.string   "observacoes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "empresa_id"
    t.integer  "socio_id"
  end

  create_table "socios", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.date     "dataNascimento"
    t.string   "administrador"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "empresa_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "veiculos", force: :cascade do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "ano"
    t.string   "placa"
    t.string   "cidade"
    t.string   "uf"
    t.string   "cri"
    t.string   "observacoes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "empresa_id"
    t.integer  "socio_id"
  end

end
