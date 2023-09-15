class AddFullNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :full_name, :string
  end
end
