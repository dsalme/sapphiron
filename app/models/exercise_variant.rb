class ExerciseVariant < ApplicationRecord
  belongs_to :exercise
  belongs_to :variant, class_name: 'Exercise', foreign_key: 'variant_id'
end
