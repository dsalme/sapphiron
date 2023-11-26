class Aspect < ApplicationRecord
  has_many :blocks
  validates :name, uniqueness: true, presence: true
end
