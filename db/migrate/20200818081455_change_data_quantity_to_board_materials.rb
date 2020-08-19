class ChangeDataQuantityToBoardMaterials < ActiveRecord::Migration[5.2]
  def change
    change_column :board_materials, :quantity, :text
  end
end
