class CreatePcrtesteds < ActiveRecord::Migration[5.2]
  def change
    create_table :pcrtesteds do |t|
      t.date :day
      t.string :pcrtest

      t.timestamps
    end
  end
end
