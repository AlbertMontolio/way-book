class AddForeignKeyOwnCompanySkills < ActiveRecord::Migration[5.0]
  def change
  	add_column :own_company_skills, :category_id, :integer
	add_foreign_key :own_company_skills, :categories
  end
end
