class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      
      t.string :spanish
      t.string :japanese
      t.text :spanish_example
      t.text :japanese_example
      # t.boolean :is_active, null: false, default: true
      t.integer :status, default: 0, null: false
      
      t.timestamps
    end
  end
end
