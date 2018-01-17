class Category < ApplicationRecord
	has_many :company_skills, dependent: :destroy
	has_many :own_company_skills, dependent: :destroy
	belongs_to :division
end
