class AddForeignKeyToDivisionId < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :categories, :divisions
  end
end
