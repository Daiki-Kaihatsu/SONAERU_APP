class CreatePcrpositives < ActiveRecord::Migration[5.2]
  def change
    create_table :pcrpositives do |t|
      t.date :day
      t.string :positive

      t.timestamps
    end
  end
end
