class RenameStartColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :start, :start_date
  end
end
