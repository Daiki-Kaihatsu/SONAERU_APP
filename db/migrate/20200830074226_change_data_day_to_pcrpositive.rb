class ChangeDataDayToPcrpositive < ActiveRecord::Migration[5.2]
  def change
    change_column :pcrpositives, :day, :date
  end
end
