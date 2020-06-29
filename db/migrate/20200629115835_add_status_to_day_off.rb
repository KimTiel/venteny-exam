class AddStatusToDayOff < ActiveRecord::Migration[6.0]
  def change
    add_column :day_off_requests, :approve, :boolean, default: false
    add_column :day_off_requests, :denied, :boolean, default: false
  end
end
