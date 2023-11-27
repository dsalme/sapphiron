class Aspect < ApplicationRecord
  has_many :blocks, dependent: :restrict_with_error
  validates :name, uniqueness: true, presence: true
end
