class ChangeFiledsToGntUser < ActiveRecord::Migration[7.0]
  def change
    change_column :gnt_users, :fingerprint_status, :string
  end
end
