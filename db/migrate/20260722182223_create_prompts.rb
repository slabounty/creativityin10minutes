class CreatePrompts < ActiveRecord::Migration[8.1]
  def change
    create_table :prompts do |t|
      t.string :title
      t.text :instructions
      t.string :category
      t.boolean :active

      t.timestamps
    end
  end
end
