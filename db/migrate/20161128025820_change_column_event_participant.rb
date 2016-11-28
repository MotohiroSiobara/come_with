class ChangeColumnEventParticipant < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :participants, :participant_count
  end
end
