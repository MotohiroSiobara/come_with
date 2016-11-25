class AddColumnEventImageEtc < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :schedule, :datetime
    add_column :events, :recruitment_numbers, :integer
    add_column :events, :participants, :integer
    add_column :events, :result, :boolean
  end
end
