class CreateDayOffRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :day_off_requests do |t|
      t.string :reason
      t.date :day_off_date

      t.timestamps
    end
  end
end
