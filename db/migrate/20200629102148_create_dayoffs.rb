class CreateDayoffs < ActiveRecord::Migration[6.0]
  def change
    create_table :dayoffs do |t|
      t.integer :no_dayoff

      t.timestamps
    end
  end
end
