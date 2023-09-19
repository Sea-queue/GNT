class AddProfileInfoToGntusers < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :nationality, :string
    add_column :gnt_users, :i_am, :integer
    add_column :gnt_users, :years_of_experience, :integer
    add_column :gnt_users, :apply_visa_for, :string
    add_column :gnt_users, :current_resident, :text
  end
end
