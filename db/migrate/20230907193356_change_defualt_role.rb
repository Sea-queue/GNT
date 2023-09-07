class ChangeDefualtRole < ActiveRecord::Migration[7.0]
  def change
    change_column :gnt_users, :role, :string, default: "candidate"
  end
end
