class AddDivisionIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :division_id, :integer
  end
end
