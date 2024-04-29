class AddCertificationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :certification, :string
  end
end
