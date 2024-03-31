class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|

      t.string :title
      t.text :body
      t.boolean :is_active, null: false, default: true
  　　#解決/未解決、公開/非公開のbooleanを設定したい。2つ書くべきか。
      t.timestamps
    end
  end
end
