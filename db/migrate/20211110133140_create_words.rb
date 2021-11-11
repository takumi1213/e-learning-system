class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.integer :category_id
      t.string :word

      t.timestamps
    end
  end
end
