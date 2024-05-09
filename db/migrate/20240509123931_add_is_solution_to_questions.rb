class AddIsSolutionToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :is_solution, :boolean, default: false, null: false
  end
end
