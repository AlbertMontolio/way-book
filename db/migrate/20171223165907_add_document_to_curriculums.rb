class AddDocumentToCurriculums < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculums, :document, :string
  end
end
