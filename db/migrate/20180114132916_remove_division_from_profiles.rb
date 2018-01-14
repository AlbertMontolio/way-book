class RemoveDivisionFromProfiles < ActiveRecord::Migration[5.0]
  def change
  	remove_column :profiles, :division
  end
end
