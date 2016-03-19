class AddWorkLocationToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:work_location,:string
  end
end
