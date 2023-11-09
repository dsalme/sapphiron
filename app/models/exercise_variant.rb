class ExerciseVariant < ApplicationRecord
  belongs_to :exercise
  belongs_to :variant, class_name: 'Exercise', foreign_key: 'variant_id'
  validates :variant_id, uniqueness: { scope: :exercise_id }
end
