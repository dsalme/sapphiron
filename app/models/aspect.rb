class Aspect < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
