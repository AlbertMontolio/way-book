class AddFirstNameToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :phone_number, :string
    add_column :profiles, :position, :string
  end
end
