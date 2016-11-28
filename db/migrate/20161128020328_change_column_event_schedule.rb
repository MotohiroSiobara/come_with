class ChangeColumnEventSchedule < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :schedule, :date
  end
end
