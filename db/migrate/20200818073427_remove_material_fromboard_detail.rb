class RemoveMaterialFromboardDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :board_details, :material, :text
  end
end
