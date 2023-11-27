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

ActiveRecord::Schema[7.1].define(version: 2023_11_26_204118) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "aspects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_exercises", force: :cascade do |t|
    t.bigint "block_id", null: false
    t.bigint "exercise_id", null: false
    t.integer "repetitions"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_block_exercises_on_block_id"
    t.index ["exercise_id"], name: "index_block_exercises_on_exercise_id"
  end

  create_table "block_inner_blocks", force: :cascade do |t|
    t.bigint "block_id", null: false
    t.bigint "inner_block_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_block_inner_blocks_on_block_id"
    t.index ["inner_block_id"], name: "index_block_inner_blocks_on_inner_block_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "protocol_id", null: false
    t.bigint "aspect_id", null: false
    t.integer "series"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["aspect_id"], name: "index_blocks_on_aspect_id"
    t.index ["protocol_id"], name: "index_blocks_on_protocol_id"
    t.index ["user_id"], name: "index_blocks_on_user_id"
  end

  create_table "exercise_movement_patterns", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "movement_pattern_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_movement_patterns_on_exercise_id"
    t.index ["movement_pattern_id"], name: "index_exercise_movement_patterns_on_movement_pattern_id"
  end

  create_table "exercise_muscles", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "muscle_id", null: false
    t.integer "predominance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_muscles_on_exercise_id"
    t.index ["muscle_id"], name: "index_exercise_muscles_on_muscle_id"
  end

  create_table "exercise_tools", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "tool_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_tools_on_exercise_id"
    t.index ["tool_id"], name: "index_exercise_tools_on_tool_id"
  end

  create_table "exercise_variants", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "variant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_variants_on_exercise_id"
    t.index ["variant_id"], name: "index_exercise_variants_on_variant_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "difficulty"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "movement_patterns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "muscle_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["muscle_group_id"], name: "index_muscles_on_muscle_group_id"
  end

  create_table "protocols", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "measure_unit", default: 0
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "thumbnail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "block_exercises", "blocks"
  add_foreign_key "block_exercises", "exercises"
  add_foreign_key "block_inner_blocks", "blocks"
  add_foreign_key "block_inner_blocks", "blocks", column: "inner_block_id"
  add_foreign_key "blocks", "aspects"
  add_foreign_key "blocks", "protocols"
  add_foreign_key "blocks", "users"
  add_foreign_key "exercise_movement_patterns", "exercises"
  add_foreign_key "exercise_movement_patterns", "movement_patterns"
  add_foreign_key "exercise_muscles", "exercises"
  add_foreign_key "exercise_muscles", "muscles"
  add_foreign_key "exercise_tools", "exercises"
  add_foreign_key "exercise_tools", "tools"
  add_foreign_key "exercise_variants", "exercises"
  add_foreign_key "exercise_variants", "exercises", column: "variant_id"
  add_foreign_key "exercises", "users"
  add_foreign_key "muscles", "muscle_groups"
end
