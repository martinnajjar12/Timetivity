class RemoveTimeFormActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :time
  end
end
