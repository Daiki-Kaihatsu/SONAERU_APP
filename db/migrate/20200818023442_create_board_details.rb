class CreateBoardDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :board_details do |t|
      t.integer :board_id
      t.text :material
      t.string :quantity
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
