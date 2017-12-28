class Profile < ApplicationRecord
  belongs_to :user
  has_many :curriculums
  has_many :own_skills
  has_many :own_company_skills
  has_many :company_skills
  has_many :projects
end
