class AddIndexToDivisionId < ActiveRecord::Migration[5.0]
  def change
  	add_index(:categories, :division_id)
  end
end
