class AddUserIdToWords < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :user_id, :integer
  end
end
