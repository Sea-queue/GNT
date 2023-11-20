class UpdatingJobFieldsGntUser < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :interview_status, :string
    add_column :gnt_users, :interview_date, :date
  end
end
