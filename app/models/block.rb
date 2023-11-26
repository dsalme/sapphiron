class Block < ApplicationRecord
  belongs_to :user
  has_one :protocol
  has_one :aspect
  has_many :exercises
  has_many :block_exercises, dependent: :destroy
  has_many :exercises, through: :block_exercises
  has_many :block_inner_blocks, dependent: :destroy
  has_many :inner_blocks, through: :block_inner_blocks, source: :inner_block
end
