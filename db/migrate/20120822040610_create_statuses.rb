class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.boolean :up
      t.string :message

      t.timestamps
    end
  end
end
