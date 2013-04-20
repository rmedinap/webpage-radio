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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130415014342) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "auspiciadores", :force => true do |t|
    t.string   "link"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
    t.string   "color"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categorias", ["slug"], :name => "index_categorias_on_slug", :unique => true

  create_table "contactos", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.text     "mensaje"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "diapositivas", :force => true do |t|
    t.string   "pie_de_foto"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "diapositiva_picture_file_name"
    t.string   "diapositiva_picture_content_type"
    t.integer  "diapositiva_picture_file_size"
    t.datetime "diapositiva_picture_updated_at"
  end

  create_table "djs", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "imagen_dj_file_name"
    t.string   "imagen_dj_content_type"
    t.integer  "imagen_dj_file_size"
    t.datetime "imagen_dj_updated_at"
  end

  create_table "fotos", :force => true do |t|
    t.integer  "noticia_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "imagen_foto_file_name"
    t.string   "imagen_foto_content_type"
    t.integer  "imagen_foto_file_size"
    t.datetime "imagen_foto_updated_at"
  end

  create_table "itunes_players", :force => true do |t|
    t.text     "embed"
    t.integer  "noticia_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.string   "autor"
    t.integer  "categoria_id"
    t.string   "slug"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "programas", :force => true do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "quienes_somos", :force => true do |t|
    t.text     "descripcion"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "soundclouds", :force => true do |t|
    t.string   "link"
    t.integer  "noticia_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "link"
    t.integer  "noticia_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
