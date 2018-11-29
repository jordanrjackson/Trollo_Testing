class AddListIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :list_id, :bigint
  end
end
