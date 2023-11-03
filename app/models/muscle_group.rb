class MuscleGroup < ApplicationRecord
    has_many :muscles, dependent: :destroy
    validates :name, uniqueness: true
end
