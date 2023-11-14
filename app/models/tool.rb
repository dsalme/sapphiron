class Tool < ApplicationRecord
    has_many :exercise_tools, dependent: :destroy
    has_many :exercises, through: :exercise_tools
    validates :name, uniqueness: true, presence: true
end
