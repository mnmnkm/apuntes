class CreateQuestionAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :question_answers do |t|
      t.text :answer
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
