class AddForeignKeyToDivisionIdFromProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :profiles, :divisions
  end
end
