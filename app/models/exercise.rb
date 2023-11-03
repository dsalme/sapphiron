class Exercise < ApplicationRecord
    has_many :exercise_muscles, dependent: :destroy
    has_many :muscles, through: :exercise_muscles
    has_many :exercise_movement_patterns, dependent: :destroy
    has_many :movement_patterns, through: :exercise_movement_patterns
    has_many :exercise_variants, dependent: :destroy
    has_many :variants, through: :exercise_variants, source: :variant
    has_many :reverse_exercise_variants, foreign_key: :variant_id, class_name: "ExerciseVariant", dependent: :destroy
    has_many :principals, through: :reverse_exercise_variants, source: :exercise
    validates :name, uniqueness: true
end
