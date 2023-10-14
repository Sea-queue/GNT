class AddProfileInfoToGntUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :rn_lisence, :boolean
    add_column :gnt_users, :cgfns, :boolean
    add_column :gnt_users, :nclex_rn, :boolean
    add_column :gnt_users, :nclex_rn_state, :string
    add_column :gnt_users, :rn_in_us, :boolean
    add_column :gnt_users, :rn_in_us_state, :string
  end
end
