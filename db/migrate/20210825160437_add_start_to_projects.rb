class AddStartToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :start, :date
  end
end
