class AddReasonToBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :reason, :text
  end
end
