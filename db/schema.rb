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

ActiveRecord::Schema.define(version: 20170726012625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "user_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_comments_on_feature_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "comments_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "comment_id", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_features_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_features_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_features_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_features_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_features_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_features_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_features_on_cached_weighted_total"
    t.index ["product_id"], name: "index_features_on_product_id"
    t.index ["user_id"], name: "index_features_on_user_id"
  end

  create_table "features_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "feature_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "image"
    t.integer "view_count"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_products_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_products_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_products_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_products_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_products_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_products_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_products_on_cached_weighted_total"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "products_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.bigint "github_id"
    t.bigint "facebook_id"
    t.bigint "instagram_id"
    t.text "image"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

  add_foreign_key "comments", "features"
  add_foreign_key "comments", "users"
  add_foreign_key "features", "products"
  add_foreign_key "features", "users"
  add_foreign_key "products", "users"
end
