class AddImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :icon, :string
    add_column :events, :image, :string
  end
end
