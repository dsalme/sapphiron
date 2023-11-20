class Profile < ApplicationRecord
  belongs_to :account
  validates :name, uniqueness: true, presence: true
end
