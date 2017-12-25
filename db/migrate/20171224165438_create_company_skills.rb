class CreateCompanySkills < ActiveRecord::Migration[5.0]
  def change
    create_table :company_skills do |t|
      t.string :name

      t.timestamps
    end
  end
end
