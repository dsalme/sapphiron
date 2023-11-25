class AddMeasureUnitToProtocol < ActiveRecord::Migration[7.1]
  def change
    add_column :protocols, :measure_unit, :integer
  end
end
