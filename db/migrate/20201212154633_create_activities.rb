class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
