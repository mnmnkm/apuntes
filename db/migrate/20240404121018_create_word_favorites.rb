class CreateWordFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :word_favorites do |t|
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
