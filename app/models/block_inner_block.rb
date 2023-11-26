class BlockInnerBlock < ApplicationRecord
  belongs_to :block
  belongs_to :inner_block, class_name: 'Block', foreign_key: 'inner_block_id'
end
