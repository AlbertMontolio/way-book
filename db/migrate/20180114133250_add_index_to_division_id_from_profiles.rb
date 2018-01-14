class AddIndexToDivisionIdFromProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_index(:profiles, :division_id)
  end
end
