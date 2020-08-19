class CreateBoardMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :board_materials do |t|
      t.integer :board_id
      t.text :material
      t.string :quantity

      t.timestamps
    end
  end
end
