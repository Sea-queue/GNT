class FieldUpdateToGntUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :gnt_users, :first_name, :full_name
    change_column :gnt_users, :request_to_apply, :boolean, default: false
    change_column :gnt_users, :grant_apply_request, :boolean, default: false
  end
end
