class ChangeForeignKeyCurriculums < ActiveRecord::Migration[5.0]
  def change
  	rename_column :curriculums, :user_id, :profile_id
  end
end
