class AddTypeColumnToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :activity_type, :string
  end
end
