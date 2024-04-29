class AddIntroductionAndSpanishLevelToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :string
    add_column :users, :spanish_level, :integer
  end
end
