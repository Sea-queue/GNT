class AddRolesToGntUser < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :role, :string
  end
end
