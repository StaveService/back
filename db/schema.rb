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

ActiveRecord::Schema.define(version: 2021_08_28_074023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "album_bookmarks", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id", "user_id"], name: "index_album_bookmarks_on_album_id_and_user_id", unique: true
    t.index ["album_id"], name: "index_album_bookmarks_on_album_id"
    t.index ["user_id"], name: "index_album_bookmarks_on_user_id"
  end

  create_table "album_links", force: :cascade do |t|
    t.integer "itunes"
    t.string "spotify"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_links_on_album_id"
  end

  create_table "album_musics", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id", "music_id"], name: "index_album_musics_on_album_id_and_music_id", unique: true
    t.index ["album_id"], name: "index_album_musics_on_album_id"
    t.index ["music_id"], name: "index_album_musics_on_music_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "bookmarks_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artist_albums", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_artist_albums_on_album_id"
    t.index ["artist_id", "album_id"], name: "index_artist_albums_on_artist_id_and_album_id", unique: true
    t.index ["artist_id"], name: "index_artist_albums_on_artist_id"
  end

  create_table "artist_bands", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "band_id"], name: "index_artist_bands_on_artist_id_and_band_id", unique: true
    t.index ["artist_id"], name: "index_artist_bands_on_artist_id"
    t.index ["band_id"], name: "index_artist_bands_on_band_id"
  end

  create_table "artist_bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_bookmarks_on_artist_id"
    t.index ["user_id", "artist_id"], name: "index_artist_bookmarks_on_user_id_and_artist_id", unique: true
    t.index ["user_id"], name: "index_artist_bookmarks_on_user_id"
  end

  create_table "artist_links", force: :cascade do |t|
    t.bigint "artist_id"
    t.integer "itunes"
    t.string "twitter"
    t.string "spotify"
    t.integer "wikipedia"
    t.string "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_links_on_artist_id"
  end

  create_table "artist_musics", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "music_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "music_id"], name: "index_artist_musics_on_artist_id_and_music_id", unique: true
    t.index ["artist_id"], name: "index_artist_musics_on_artist_id"
    t.index ["music_id"], name: "index_artist_musics_on_music_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "bookmarks_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "band_albums", force: :cascade do |t|
    t.bigint "band_id"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_band_albums_on_album_id"
    t.index ["band_id", "album_id"], name: "index_band_albums_on_band_id_and_album_id", unique: true
    t.index ["band_id"], name: "index_band_albums_on_band_id"
  end

  create_table "band_bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_bookmarks_on_band_id"
    t.index ["user_id", "band_id"], name: "index_band_bookmarks_on_user_id_and_band_id", unique: true
    t.index ["user_id"], name: "index_band_bookmarks_on_user_id"
  end

  create_table "band_links", force: :cascade do |t|
    t.bigint "band_id"
    t.integer "itunes"
    t.string "twitter"
    t.string "spotify"
    t.integer "wikipedia"
    t.string "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_links_on_band_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "bookmarks_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "composer_musics", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "music_id"], name: "index_composer_musics_on_artist_id_and_music_id", unique: true
    t.index ["artist_id"], name: "index_composer_musics_on_artist_id"
    t.index ["music_id"], name: "index_composer_musics_on_music_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "music_id"
    t.bigint "user_id"
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_issues_on_music_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "lyrist_musics", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "music_id"], name: "index_lyrist_musics_on_artist_id_and_music_id", unique: true
    t.index ["artist_id"], name: "index_lyrist_musics_on_artist_id"
    t.index ["music_id"], name: "index_lyrist_musics_on_music_id"
  end

  create_table "mobility_string_translations", force: :cascade do |t|
    t.string "locale", null: false
    t.string "key", null: false
    t.string "value"
    t.string "translatable_type"
    t.bigint "translatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_string_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_string_translations_on_keys", unique: true
    t.index ["translatable_type", "key", "value", "locale"], name: "index_mobility_string_translations_on_query_keys"
  end

  create_table "mobility_text_translations", force: :cascade do |t|
    t.string "locale", null: false
    t.string "key", null: false
    t.text "value"
    t.string "translatable_type"
    t.bigint "translatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_text_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_text_translations_on_keys", unique: true
  end

  create_table "music_bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_music_bookmarks_on_music_id"
    t.index ["user_id", "music_id"], name: "index_music_bookmarks_on_user_id_and_music_id", unique: true
    t.index ["user_id"], name: "index_music_bookmarks_on_user_id"
  end

  create_table "music_links", force: :cascade do |t|
    t.integer "itunes"
    t.integer "musixmatch"
    t.string "spotify"
    t.string "youtube"
    t.bigint "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_music_links_on_music_id"
  end

  create_table "musics", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "band_id"
    t.string "title", default: "", null: false
    t.integer "bookmarks_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_musics_on_band_id"
    t.index ["user_id"], name: "index_musics_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient_type_and_recipient_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "user_links", force: :cascade do |t|
    t.bigint "user_id"
    t.string "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_links_on_user_id"
  end

  create_table "user_relationships", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_user_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_user_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_user_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "nickname", default: "", null: false
    t.string "image"
    t.string "email"
    t.string "familyname", default: "", null: false
    t.string "givenname", default: "", null: false
    t.string "introduction", default: "", null: false
    t.date "birthday"
    t.integer "gender"
    t.integer "following_count", default: 0, null: false
    t.integer "followers_count", default: 0, null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "album_bookmarks", "albums"
  add_foreign_key "album_bookmarks", "users"
  add_foreign_key "album_links", "albums"
  add_foreign_key "album_musics", "albums"
  add_foreign_key "album_musics", "musics"
  add_foreign_key "artist_albums", "albums"
  add_foreign_key "artist_albums", "artists"
  add_foreign_key "artist_bands", "artists"
  add_foreign_key "artist_bands", "bands"
  add_foreign_key "artist_bookmarks", "artists"
  add_foreign_key "artist_bookmarks", "users"
  add_foreign_key "artist_links", "artists"
  add_foreign_key "artist_musics", "artists"
  add_foreign_key "artist_musics", "musics"
  add_foreign_key "band_albums", "albums"
  add_foreign_key "band_albums", "bands"
  add_foreign_key "band_bookmarks", "bands"
  add_foreign_key "band_bookmarks", "users"
  add_foreign_key "band_links", "bands"
  add_foreign_key "composer_musics", "artists"
  add_foreign_key "composer_musics", "musics"
  add_foreign_key "issues", "musics"
  add_foreign_key "issues", "users"
  add_foreign_key "lyrist_musics", "artists"
  add_foreign_key "lyrist_musics", "musics"
  add_foreign_key "music_bookmarks", "musics"
  add_foreign_key "music_bookmarks", "users"
  add_foreign_key "music_links", "musics"
  add_foreign_key "musics", "bands"
  add_foreign_key "musics", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "user_relationships", "users", column: "followed_id"
  add_foreign_key "user_relationships", "users", column: "follower_id"
end
