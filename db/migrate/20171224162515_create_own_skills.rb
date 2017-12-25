class CreateOwnSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :own_skills do |t|
      t.string :name
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
