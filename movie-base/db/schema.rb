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

ActiveRecord::Schema[7.1].define(version: 20_240_216_204_428) do
  create_table 'film_casts', force: :cascade do |t|
    t.integer 'film_id', null: false
    t.integer 'actor_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['actor_id'], name: 'index_film_casts_on_actor_id'
    t.index ['film_id'], name: 'index_film_casts_on_film_id'
  end

  create_table 'film_directors', force: :cascade do |t|
    t.integer 'film_id', null: false
    t.integer 'director_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['director_id'], name: 'index_film_directors_on_director_id'
    t.index ['film_id'], name: 'index_film_directors_on_film_id'
  end

  create_table 'films', force: :cascade do |t|
    t.string 'title'
    t.string 'genre'
    t.date 'release_date'
    t.float 'score'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sources', force: :cascade do |t|
    t.string 'format'
    t.string 'path'
    t.string 'runtime'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'film_id', null: false
    t.index ['film_id'], name: 'index_sources_on_film_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'document'
    t.string 'document_type'
    t.date 'birth_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'sources', 'films'
end
