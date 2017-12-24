class Curriculum < ApplicationRecord
  belongs_to :profile
  mount_uploader :document, DocumentUploader
end
