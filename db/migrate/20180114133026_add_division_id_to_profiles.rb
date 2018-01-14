class AddDivisionIdToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :division_id, :integer
  end
end
