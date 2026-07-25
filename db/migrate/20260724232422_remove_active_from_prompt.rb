class RemoveActiveFromPrompt < ActiveRecord::Migration[8.1]
  def change
    remove_column :prompts, :active, :boolean
  end
end
