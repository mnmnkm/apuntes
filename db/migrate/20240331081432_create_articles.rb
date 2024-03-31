class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
