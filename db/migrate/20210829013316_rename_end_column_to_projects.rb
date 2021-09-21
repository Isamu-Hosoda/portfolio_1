class RenameEndColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :end, :end_date
  end
end
