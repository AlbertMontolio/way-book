class RenameTablePdfsToResumes < ActiveRecord::Migration[5.0]
  def change
  	rename_table :pdfs, :curriculums
  end
end
