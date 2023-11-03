class Muscle < ApplicationRecord
  belongs_to :muscle_group
  has_many :exercise_muscles, dependent: :destroy
  has_many :exercises, through: :exercise_muscles
  validates :name, uniqueness: true
end
