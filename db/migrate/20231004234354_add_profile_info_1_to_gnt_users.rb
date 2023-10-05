class AddProfileInfo1ToGntUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :gnt_users, :first_name, :string
    add_column :gnt_users, :legal_name, :string
    add_column :gnt_users, :terms_of_use, :boolean
    add_column :gnt_users, :where_hear, :string
    add_column :gnt_users, :year_of_graduation, :string
    add_column :gnt_users, :currently_working, :boolean
    add_column :gnt_users, :langauges_spoken, :string
    add_column :gnt_users, :phone_number, :string
    add_column :gnt_users, :auth_whatsapp, :boolean
    add_column :gnt_users, :auth_text, :boolean
    add_column :gnt_users, :license_type, :string
    add_column :gnt_users, :stage3_1, :boolean
    add_column :gnt_users, :clinical_hour, :integer
    add_column :gnt_users, :other_1, :text
    add_column :gnt_users, :other_2, :text
    add_column :gnt_users, :other_3, :text
    add_column :gnt_users, :english_proficiency, :string
    add_column :gnt_users, :english_exam_pass_date, :date
    add_column :gnt_users, :background_check, :boolean
    add_column :gnt_users, :convicted_crime, :boolean
    add_column :gnt_users, :disorder, :boolean
  end
end
