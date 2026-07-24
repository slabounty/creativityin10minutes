class CreateMedia < ActiveRecord::Migration[8.1]
  def change
    create_table :media do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
