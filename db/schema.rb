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

ActiveRecord::Schema[7.1].define(version: 2023_11_09_084655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "thumbnail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercise_movement_patterns", "exercises"
  add_foreign_key "exercise_movement_patterns", "movement_patterns"
  add_foreign_key "exercise_muscles", "exercises"
  add_foreign_key "exercise_muscles", "muscles"
  add_foreign_key "exercise_tools", "exercises"
  add_foreign_key "exercise_tools", "tools"
  add_foreign_key "exercise_variants", "exercises"
  add_foreign_key "exercise_variants", "exercises", column: "variant_id"
  add_foreign_key "muscles", "muscle_groups"
end
