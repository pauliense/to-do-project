class ChangeColumnDone < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :done, :boolean, :default => false, :allow_nil => false
  end
end
