class AddHrStaffToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :hr_staff, :boolean, default: false
  end
end
