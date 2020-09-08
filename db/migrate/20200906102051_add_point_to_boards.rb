class AddPointToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :point, :text
  end
end
