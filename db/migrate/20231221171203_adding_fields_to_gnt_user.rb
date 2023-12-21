class AddingFieldsToGntUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :gnt_users, :check_list_0, :check_list_10
    add_column :gnt_users, :registration_status, :boolean, default: false
    add_column :gnt_users, :fingerprint_status, :boolean, default: false
    add_column :gnt_users, :fingerprint_date, :date
  end
end
