class CreateRecoveries < ActiveRecord::Migration[5.2]
  def change
    create_table :recoveries do |t|
      t.date :day
      t.string :recovery

      t.timestamps
    end
  end
end
