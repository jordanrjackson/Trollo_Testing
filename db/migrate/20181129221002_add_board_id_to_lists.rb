class AddBoardIdToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :board_id, :bigint
  end
end
