class ChangeProtocolMeasureUnit < ActiveRecord::Migration[7.1]
  def change
    change_column :protocols, :measure_unit, :integer, default: 0
  end
end
