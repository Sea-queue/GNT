class AddingMoreFieldsToGntUser < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :request_english_assessment, :boolean, default: false
    add_column :gnt_users, :current_resident_state, :string
    add_column :gnt_users, :top_specialties, :string
  end
end
