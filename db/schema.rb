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

ActiveRecord::Schema.define(version: 2019_11_25_004139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "image"
    t.integer "total_tracks", default: 0, null: false
    t.string "spotify_url"
    t.string "spotify_id", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums_artists", id: false, force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "album_id", null: false
    t.index ["album_id", "artist_id"], name: "index_albums_artists_on_album_id_and_artist_id"
    t.index ["artist_id", "album_id"], name: "index_albums_artists_on_artist_id_and_album_id"
  end

  create_table "albums_songs", id: false, force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "song_id", null: false
    t.index ["album_id", "song_id"], name: "index_albums_songs_on_album_id_and_song_id"
    t.index ["song_id", "album_id"], name: "index_albums_songs_on_song_id_and_album_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "image"
    t.integer "popularity", default: 0, null: false
    t.string "spotify_url"
    t.string "spotify_id", default: "", null: false
    t.text "genres", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "preview_url"
    t.integer "duration_ms", default: 0, null: false
    t.boolean "explicit"
    t.string "spotify_url"
    t.string "spotify_id", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
