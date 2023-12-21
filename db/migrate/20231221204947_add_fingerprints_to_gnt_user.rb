class AddFingerprintsToGntUser < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :fingerprint_status, :string
  end
end
