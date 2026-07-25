class RemoveActiveFromMedium < ActiveRecord::Migration[8.1]
  def change
    remove_column :media, :active, :boolean
  end
end
