class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :line_text
      t.integer :line_index, unique: true, null:false

      t.timestamps null: false
    end
  end
end
