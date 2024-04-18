class CreateAnswerFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_favorites do |t|
      t.integer :user_id
      t.integer :question_answer_id

      t.timestamps
    end
  end
end
