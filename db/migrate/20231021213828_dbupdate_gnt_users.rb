class DbupdateGntUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :gnt_users, :full_name
    remove_column :gnt_users, :phone_number
    rename_column :gnt_users, :langauges_spoken, :languages_spoken
    add_column :gnt_users, :country_code, :string
    add_column :gnt_users, :phone_number, :string
  end
end
