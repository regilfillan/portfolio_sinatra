class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :content, :location
    add_column :posts, :days, :string
    add_column :posts, :budget, :string
    add_column :posts, :transport, :string
    add_column :posts, :accommodation, :string
  end
end
