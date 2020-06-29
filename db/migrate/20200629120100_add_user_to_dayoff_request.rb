class AddUserToDayoffRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :day_off_requests, :user_id, :integer
    add_index :day_off_requests, :user_id
  end
end
