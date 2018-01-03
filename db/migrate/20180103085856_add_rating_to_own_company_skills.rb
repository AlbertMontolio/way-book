class AddRatingToOwnCompanySkills < ActiveRecord::Migration[5.0]
  def change
    add_column :own_company_skills, :rating, :integer
  end
end
