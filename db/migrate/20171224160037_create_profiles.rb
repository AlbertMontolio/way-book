class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :division
      t.string :team
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
