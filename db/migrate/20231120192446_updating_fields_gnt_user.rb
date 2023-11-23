class UpdatingFieldsGntUser < ActiveRecord::Migration[7.0]
  def change
    change_column :gnt_users, :nclex_rn, :string
    add_column :gnt_users, :license_number, :integer
    add_column :gnt_users, :expiration_date, :date
    add_column :gnt_users, :additional_active_compact_license, :boolean, default: false
    add_column :gnt_users, :visascreen_status, :string
  end
end
