class AddDueDateToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :date, :datetime
  end
end
