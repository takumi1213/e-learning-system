class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.integer :word_id
      t.string :choice
      t.boolean :correct

      t.timestamps
    end
  end
end
