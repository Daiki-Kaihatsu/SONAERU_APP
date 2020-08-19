class RemoveQuantityFromboardDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :board_details, :quantity, :string
  end
end
