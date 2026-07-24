class CreateDailyPrompts < ActiveRecord::Migration[8.1]
  def change
    create_table :daily_prompts do |t|
      t.date :prompt_date
      t.references :prompt, null: false, foreign_key: true
      t.references :medium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
