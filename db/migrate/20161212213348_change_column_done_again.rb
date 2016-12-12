class ChangeColumnDoneAgain < ActiveRecord::Migration[5.0]
  def change
        change_column :tasks, :done, :boolean, default: false, null: false
  end
end
