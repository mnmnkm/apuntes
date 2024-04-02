class CreateWordComments < ActiveRecord::Migration[6.1]
  def change
    create_table :word_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
