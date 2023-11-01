class MoreFiledsOnApplicationTogntUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :request_to_apply, :boolean
    add_column :gnt_users, :grant_apply_request, :boolean
    add_column :gnt_users, :medical_surgical, :integer
    add_column :gnt_users, :pediatrics, :integer
    add_column :gnt_users, :obstetrics_gynecology, :integer
    add_column :gnt_users, :psychiatry, :integer
    add_column :gnt_users, :emergency, :integer
    add_column :gnt_users, :critical_care_icu, :integer
    add_column :gnt_users, :geriatrics_nursing_home, :integer
    add_column :gnt_users, :other_specialty_name, :string
    add_column :gnt_users, :other_specialty_hour, :integer
  end
end
