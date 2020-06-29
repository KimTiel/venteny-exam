class AddYearOnDayoff < ActiveRecord::Migration[6.0]
  def change
    add_column :dayoffs, :year, :integer
  end
end
