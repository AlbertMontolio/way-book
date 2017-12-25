class CreateOwnCompanySkills < ActiveRecord::Migration[5.0]
  def change
    create_table :own_company_skills do |t|
      t.string :name
      t.boolean :check, default: :true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
