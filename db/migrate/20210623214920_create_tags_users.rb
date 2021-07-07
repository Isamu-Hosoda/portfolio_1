class CreateTagsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tags_users, id: false do |t|
      t.references :tag, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
