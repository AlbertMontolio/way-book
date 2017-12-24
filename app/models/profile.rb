class Profile < ApplicationRecord
  belongs_to :user
  has_many :curriculums
end
