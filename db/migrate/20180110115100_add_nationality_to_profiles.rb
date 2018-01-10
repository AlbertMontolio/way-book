class AddNationalityToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :nationality, :string
    add_column :profiles, :birthday, :date
    add_column :profiles, :startway, :date
    add_column :profiles, :endway, :date
  end
end
