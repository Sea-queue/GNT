class ChangeYearsIAmType < ActiveRecord::Migration[7.0]
  def change
    change_column :gnt_users, :i_am, :string
    change_column :gnt_users, :years_of_experience, :string
  end
end
