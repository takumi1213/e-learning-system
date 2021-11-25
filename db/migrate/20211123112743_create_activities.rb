class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.integer :actionable_id 
      t.string :actionable_type

      t.timestamps
    end
  end
end
