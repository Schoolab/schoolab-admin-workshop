class RenameProjectType < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :type, :project_type
  end
end
