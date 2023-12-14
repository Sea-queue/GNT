class AddingFiledsToGntUser < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :check_list_1, :boolean, default: false
    add_column :gnt_users, :check_list_2, :boolean, default: false
    add_column :gnt_users, :check_list_3, :boolean, default: false
    add_column :gnt_users, :check_list_4, :boolean, default: false
    add_column :gnt_users, :check_list_5, :boolean, default: false
    add_column :gnt_users, :check_list_6, :boolean, default: false
    add_column :gnt_users, :check_list_7, :boolean, default: false
    add_column :gnt_users, :check_list_8, :boolean, default: false
    add_column :gnt_users, :check_list_9, :boolean, default: false
    add_column :gnt_users, :check_list_0, :boolean, default: false
    add_column :gnt_users, :check_list_11, :boolean, default: false
    add_column :gnt_users, :check_list_12, :boolean, default: false
    add_column :gnt_users, :check_list_13, :boolean, default: false
  end
end
