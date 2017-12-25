class CreatePairs < ActiveRecord::Migration[5.0]
  def change
    create_table :pairs do |t|
      t.references :category, foreign_key: true
      t.references :company_skill, foreign_key: true

      t.timestamps
    end
  end
end
