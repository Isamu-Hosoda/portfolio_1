class AddEndToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :end, :date
  end
end
