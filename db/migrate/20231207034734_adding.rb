class Adding < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :stage_1, :boolean, default: false
    add_column :gnt_users, :stage_2, :boolean, default: false
    add_column :gnt_users, :stage_3, :boolean, default: false
    add_column :gnt_users, :stage_4, :boolean, default: false
    add_column :gnt_users, :stage_5, :boolean, default: false
    add_column :gnt_users, :stage_6, :boolean, default: false
    add_column :gnt_users, :stage_7, :boolean, default: false
    add_column :gnt_users, :stage_8, :boolean, default: false
    add_column :gnt_users, :stage_9, :boolean, default: false
    add_column :gnt_users, :stage_10, :boolean, default: false
  end
end
