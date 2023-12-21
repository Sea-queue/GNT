class RemoveFingerprintsToGntUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :gnt_users, :fingerprint_status
  end
end
